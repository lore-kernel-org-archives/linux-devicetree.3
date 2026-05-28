Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A022978F26
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980503; cv=none; b=SIDXtR0HIsi5CwSKaCv+8kaownl6Mrcnn15kABX3lj8pIJ+stv4APQ69NTm0qWu+FoICkdFSKs3pDxp1krc2I+x4HdCgGVPOhWs/01FnMLlmRkqe1QVTpQ9w60Dx77YiS4qocwcNUWHEeJrrKoR/sRORQPaxpOvH/8Q7kQCkReM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980503; c=relaxed/simple;
	bh=4GnQVk4uJA7GqOVb6u3PPbujRwmpQUG2pQItHH9GCpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZ+Wmdycg0w4T38TRVP8Gvsc54J+5HaKd9w/rVMPF1XmgUKQ3/yKvPLN1NY6kPRPNKFl2i1xReeZW/w9FA8c+GsPv/McVOrWr/iJ8y1b/7KyMh53SC9aPTbf4myDyoDLmwKShYgc0pg7rL+HqwEF/3miwMeddehaKh/dZtDSCcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9zBzMtp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpCneZn+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9zBzMtp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpCneZn+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vZSj1697195
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HaNfui2FG1mDwh5+yjz39dTw
	V8xEs4HnIe4IRTWrOCk=; b=j9zBzMtpg2a0zAo1dbjkUAhgcaqPvS3C88TpbmzA
	uVUAYH0iMmGQ2YPZKcK6NJkkZIjOVbedeR6gEZZSwwjlHkq1ghl1aSNlvdRsItcv
	Z2a6ZupDf3940txV56UAhdQDw6duoQNb/cZ0Kke4SaJuG8SVogdSIL+ZAO54JyWi
	7mnGRPt9tize3mouTI+CaCN68ukd/YooOaG8fO+f8chao1xA2WLD/a9ZeB0bHJET
	QmzxRMXmVDVIP3Wp3xJppAfQaM0slC+POgxtkeFkHJGBnt9V42Us9U61IUqLaEMO
	+tZm3Yj5PXxNQpbqphnX1dOsJ6C7eSd3NIVCCGO9Lpd7PA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yak89n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:01:36 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95cf2f6a8d6so16510419241.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779980495; x=1780585295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HaNfui2FG1mDwh5+yjz39dTwV8xEs4HnIe4IRTWrOCk=;
        b=EpCneZn+Qeia6C8temy4Yh9j1Xmuaxzi/2itOlFfmUtPfsO6F2vVLU0o4XnvBlifEC
         T9nQwPBSVYhZvpm/uIPeRdi3Lu/iUrdiWQ4o5Hy5bd7iTfAfG58ow6w407R5CTPWHXcE
         ou54kXe5zAEiE19sGk1DTWYib3ZkWDenYOalqyP/ntNNhWKiLVgM7M1Pq8Yj+lbmL+Uu
         TsUdCxRSYUm+qgUbAmvzPZJpk1c2LyeunBmCyPwERtBwDiCEgaSS1GkD2Ax3XDK/aHhC
         ppVcJAcz7IJXC9/z7aU6Ec0rSIPjbTTAvBet1gypnao7YDADYco9WtZRgeXxh0A0dXhE
         b/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779980495; x=1780585295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HaNfui2FG1mDwh5+yjz39dTwV8xEs4HnIe4IRTWrOCk=;
        b=aDdcwN9aYdndiYpOpEM9niWRjrN6BsKhzLnjvDkywy3tmOiWbsXrSsQxhb4MvToZqo
         HQryNitvm6e1oqTtHYxqjDBsQzYGMKAncnH8zHODkGnbWs3TSOTyQnSYjnwUqnXjx/qD
         As9bxVXgRDzBSaxdwsoVv+plO37TWN1sFUlO71ocXoNEYeEntVY50s8qx5l42Hf1dOe9
         ooFkccHK7v/DA/KdA12utImM+CHuKi6CXULYXRu4OM7z5OVH9sEoQel08WRarF9Dkbyf
         tzvpVJWdlX9cyAqCbJFN887vQi2FEvJ9trn/t4PGFsvhsyvJOtSbQXG/ANXChW/GFC+Z
         Uzkw==
X-Forwarded-Encrypted: i=1; AFNElJ/FWuJyPq2tyByisrpylJv/Ptbj5MrCX9QnNXGvpEqRko752SkdJxvn77qpN9AMumGLaloQ2+vD46nH@vger.kernel.org
X-Gm-Message-State: AOJu0YxpYBYtpP8YUxjKRYb5o8eqfVP9ToGxmAJ4Rzw7HRDjHPacNYJD
	gnoOWG/9GLtz+RDVoEX0+nQTCfG1RbGPoIzw6jmJizXRAs3fihd1FttuoaQQzTthuJhdJB5fNrs
	9F0t/n1S6NRIjWIZt66JqpDxcLSJA/vlAT19hoBXAgpGZ2eY7Dm4R586pLG1P53aR
X-Gm-Gg: Acq92OH4azJhrMumECOi6hKd3DCjnSA6ouffcl5rXZbmANfT/SqoYUPTWtmCltshAqT
	pfIHSnP/ivhHSx4L3QBdyfCFVaqpmzyFADizRffDPE5Kkc+sLYsDQbTXrTmpSvlDldfEkn5Qos5
	fpXV8SB+hCQHtA7pvfNme1dJ6WRSJGSr4/kUD8r33vN/gKpY68SEcrrzl+IHb9ZslhjlcD/Gj1t
	isxJTgDm6S3EB7s2PQpRPv1vq448sXyoo2Ldwd0W6X+ffY4Dv6YcwJ5O2SqiPN3y8bSMxH5nlQ6
	wB0XtRJspiTQgqVJWc7LOAb/KbZ/sH+2vZgH+bjM65X4hWHlUZ/n3GR92hFw81ZqAjn5C933T5L
	b8/xWV9MzXhqae985Jv2dMzABqsMysZFtjV7QeHyTb4XeydcB0c1fBSgFt00Klj9yrcd2dQssij
	MSPTtOeK/gxTEcgJ5KEGbE0/IKdaV5NYfnGu8QD9E9+i4mMg==
X-Received: by 2002:a05:6102:6489:20b0:631:6e70:b905 with SMTP id ada2fe7eead31-6b8b027285dmr551992137.12.1779980495057;
        Thu, 28 May 2026 08:01:35 -0700 (PDT)
X-Received: by 2002:a05:6102:6489:20b0:631:6e70:b905 with SMTP id ada2fe7eead31-6b8b027285dmr551891137.12.1779980494380;
        Thu, 28 May 2026 08:01:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2f502sm39258551fa.35.2026.05.28.08.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:01:33 -0700 (PDT)
Date: Thu, 28 May 2026 18:01:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
Message-ID: <ci6qjemmmcrtva2o33mkcv5hu2o3woj7eg5563sursf455mygc@fuigqdocarsz>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <332c5b1e-8b70-4902-99f3-536dfe8e32bf@oss.qualcomm.com>
 <ahg9uFs1LqthstWi@hu-qianyu-lv.qualcomm.com>
 <791b1b88-d2d1-41f3-8902-d63dbd524bd7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <791b1b88-d2d1-41f3-8902-d63dbd524bd7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SBkU2IDjBg4INree7aSRtzv6k3vqFF0i
X-Proofpoint-GUID: SBkU2IDjBg4INree7aSRtzv6k3vqFF0i
X-Authority-Analysis: v=2.4 cv=E/r9Y6dl c=1 sm=1 tr=0 ts=6a1858d0 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=2Qrb-dWxc7tvpDbJBDUA:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE1MiBTYWx0ZWRfX4HfoouEDfH3n
 0ArccVPx6c4KEgBA9RI1eFZg9zwgaHyPTtP6X7WNIyybCBhtlIYrobFkwbLADC6CkYfjFzJJUTb
 tHyltR7g57abGee0ZWvOLK5WhVgu4VU75u3Q5uGHvGDW+7qOiyhE0OXPIjsn6of6rnZhHI5w4yX
 Cpjsdq0gKTHmpz7nkt1BnUHbbwWO88Mo/JI9JHa8BLk2IY1KHVeGQRd4rtYaJyHmCduVRFagu02
 mDzSGJmhUSYgff3iNRUMc1iE1OfoP5ntk7URZhKQcNoC/RYWRSngKlm4dwl4rcadOKs2OoIZZL0
 3HleigdC/f/pR9tBqWXivFbchuaLlMn/r/yiD+3ygwYSmjqjySjoa8/mJjdezT62/1/U2j6JwHV
 YKOZWS41+pJhI8CR2YcpGOhX0FImZjnhlfbWISXBCB2Wbll2UxN4AbBba4HXmfBPa82ZBDtBA+t
 hiQSxq3q8nh2sqqTwhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280152

On Thu, May 28, 2026 at 09:46:51PM +0800, Jie Gan wrote:
> 
> 
> On 5/28/2026 9:06 PM, Qiang Yu wrote:
> > On Thu, May 28, 2026 at 11:03:45AM +0800, Jie Gan wrote:
> > > 
> > > 
> > > On 5/28/2026 10:29 AM, Qiang Yu wrote:
> > > > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > > > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > > > register controls whether refclk is gated through to the PHY side.
> > > > 
> > > > These clkref controls are different from typical GCC branch clocks:
> > > > - only a single enable bit is present, without branch-style config bits
> > > > - regulators must be voted before enable and unvoted after disable
> > > > 
> > > > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > > > of reusing struct clk_branch semantics.
> > > > 
> > > > Also provide a common registration/probe API so the same clkref model
> > > > can be reused regardless of where clkref_en registers are placed, e.g.
> > > > TCSR on glymur and TLMM on SM8750.
> > > > 
> 
> [...]
> 
> > > > +
> > > > +static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
> > > > +{
> > > > +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> > > > +	u32 val;
> > > > +	int ret;
> > > > +
> > > > +	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
> > > > +	if (ret)
> > > > +		return ret;
> > > 
> > > regmap_read returns a negative error code on failure, but the
> > > clk_ops.is_enabled() treats the non-zero value as enabled.
> > > 
> > 
> > A regmap_read failure doesn't mean the clock is disabled.
> 
> Do we have special reason to treat the error number as "true"? Its worthy to
> add a comment to explain why.

to be 'false', the error number must be 0.


-- 
With best wishes
Dmitry
