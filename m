Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25222BE7BE
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570587; cv=none; b=OvLwM0qLHHxWNZ8vMe9hOPjoHHjOqRod/LDBiF+w/TQFQhKcYXhqZXmfKHnsqd+JCSeyInChq82A++lTzJv/8ARm9zMv2HgMXfgEVgEwczg1pfFsHBjFoMRrPqtZhfBScnkkVqd0G4+Or4lFhggE9rKnWeyHyHgnVAY5VRMzNTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570587; c=relaxed/simple;
	bh=VsfagAdCpO7zuh4tNDO7idF+JR1Sb0MGyx5Yhvjdf7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTTrFpqKYeeSTz31rXrLjI1H+JhbklK6w9zQkVp7PHOpg3zqXaB4ZDv4ooShBfvXKcGsDXl5gHQ5vSOaAwE3cNeVA+X1VEv4zJ2ZTN1BSueZia4egrhHZN1qKNT/62KsBJyYHKejYBUZP4bP5T6nK1eSs8hU4d7wyK9E4BSCzVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtICs6aN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyGcpZuC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtICs6aN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyGcpZuC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEZ3Lt2319498
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L4EV+wsPbdRo0uWel1+0PVb3
	OnOlF1D61m8N37sjDKg=; b=TtICs6aNSmO2ZhnVU+MlpA4U1Jjt0EJPd6uFB+Bs
	HOYldGUEml+O/8h/icNp7nNXC0kJzB3BCpNM240TbbSRd6dq/uVoUBj/wls05yAi
	sXan+p6BmnNWUDusZbpZrhD5myFCz6qZwOIEafFEKBTorcknhGfz0pVG6uHhYxaA
	LXpwaXO4gpa1vaCm78MpERb7yOzsmZw9aurnQ7H2H6hYz4Qch3Ti5HadXoJYvSrB
	P5QEIg14CuIpv1kOXqi+uYyHPNsq1h6urK+gvJE0zieFRGlzA/JLurMo384Qaf/1
	TqHSc4WZY53g//jrfsGB0sS/hfrxQGFaeSi/fX/R5i3jfA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn50qwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:56:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so12407944a91.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789570584; x=1790175384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4EV+wsPbdRo0uWel1+0PVb3OnOlF1D61m8N37sjDKg=;
        b=RyGcpZuCtZ/uclMuflr/qmCvx7kaoL89v8f07GB8XQu0VfsdpRwAv8bXjGx7McwXcB
         Dpjp7hxrDBCuPIb+2OpNZZhQWfcXyNXsgVICW4ZYKEqNgtGbPBFODuHFWYl9aV2bi6Pw
         5WX17uztdQo9YXzfNbZtzJZ/4zHD5QBtd+n1gvMKVKZkDkYC8QiaVfA/oCT44hQoKMyJ
         F12t2bfFwApaKeipJFzsX8PsKzweMQRYjz/0vyEcUu+lYmcz6hEwyILPmpqHfNsv4ob9
         kSlSMHSIiihH+hRWX1ubQcMqh1Sdr3zkOEdccqHtslxWJcyEPZALOaAH0glr1g6SaZkp
         M5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570584; x=1790175384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4EV+wsPbdRo0uWel1+0PVb3OnOlF1D61m8N37sjDKg=;
        b=eYYxm9elanZZIPJi/6laayRMiy+iQbMjeIfUKMK5LPZJcNysxGDXhniQNWod7c55e1
         E4Dtd5TkGE4KrwPyat4NZxbIW3LF6Bou+IT39XHI4W4JoBT2UGlYRsjt19BYKRj1uTS0
         rzOfTQkxGKZmW8I03iXawIBpvJskWKOE5jTZHfy2eImXsw8nlM74vPgB82r3lhlf8adN
         dEJBcKLDRjHTT1LAdImeBRTQS+O0pWgg2OrMms+YxnF84YWm32ZPJg+oa45jmWmJRaqk
         MbOKAlG1gfDNrDWyGGBOxlMigxqLQrLzNxg/gCJB/co/6yGK+7kPKPN+nNR5r7GiwPEL
         L3GA==
X-Forwarded-Encrypted: i=1; AKwUvBzaidRzTbdOsHJuE1Y0Kq4rmdnnzc3tY6UzeFxozWZIbrmIc7dipDIt/8/iqkZfg/R9MLO5ykXv9TXv@vger.kernel.org
X-Gm-Message-State: AFuF++l6pS/PkcyFw9/BOO1blW+l/9C9YjLJMj11APL/bQJTWlvxWS3o
	H+SVtjtQGQdP/1+m26+xxukrG8ALkbJLSMENKVAQg0Ln8ywHihWw2DVjVH8l8SfzEn4h9Ll8gix
	Mm5fkhGiI4hOSGzMm1mnu0CJsoiIqU3NKuEbokKL9uyZ8cPDKzaOjRjc0gS8v5g1C
X-Gm-Gg: AYBFou2LsgewDW+VuPcQVq7nwttEltZIqvMb37P/QRkwduCS4cxFLVeS8uS4VpL7RmR
	9YkQNs6Lw1wab0NfD89vyr3LFl+7H7+RdKcN+ta1eZiZshS7YGaWenFA13Y/hyw+l+AjUEojLaT
	MiPn77dS6w1Zk3MhIFb7ZKzZDGL7rSR8RUkSgwKQN0RopVHpqco/a2Kw4s3O7pK94JWRKos2j5w
	JMvJtClaRKYXaa15nkujP3+3q7dNoLuW8pafBGzv7zodyjrJuP/nFFu/2gHifQY+LeX/wL17wJY
	OSjF4d6RhHxGimJWnBL2PVrXTf6PUqjHsV2TUNuYDmRDgLLnk95nexdfi4S8CjeXMKsiUiTDhnp
	fm2j0OB3IZZDaxNtRTVkBS3U0wR9YQ04V4onkjzuQZCY=
X-Received: by 2002:a17:90b:17c1:b0:39d:e75d:f33 with SMTP id 98e67ed59e1d1-39e1e4c6388mr6448631a91.19.1789570583952;
        Wed, 16 Sep 2026 07:56:23 -0700 (PDT)
X-Received: by 2002:a17:90b:17c1:b0:39d:e75d:f33 with SMTP id 98e67ed59e1d1-39e1e4c6388mr6448576a91.19.1789570583505;
        Wed, 16 Sep 2026 07:56:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm10149958eec.1.2026.09.16.07.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:56:23 -0700 (PDT)
Date: Wed, 16 Sep 2026 22:56:17 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord-embedded: Add USB resources
 and PHYs
Message-ID: <aqquESyto1TY2Wjg@QCOM-aGQu4IUr3Y>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
 <0956417a-f91e-4ad4-8f88-2b9602af8978@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0956417a-f91e-4ad4-8f88-2b9602af8978@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwMiBTYWx0ZWRfX49az15SJ4D0o
 5+LTp21QemGkHMca2MkvgatlxpKoTr/1Dlaz1urpMXmXNkwH9t91+yX4LO0FuT4mH0L1s7H3Uvl
 JPXenp9+IOQTi/unPYqVyC1HfxuYqFPkaG74u2wBI89P3mSChJ8J/lsPc1J2xsTL7cUOanCS50d
 FQJwP1nPVko4IhOQrc6GKybnP9XmPLbKaSQ3DTGX919D6EVN6/6TEUWmneoJfdD6afv9lrpnK9f
 0sKvMZr4ClTuUT412R2HhAi6qO74ceomF2yk5H5SaLDKSeKsVdJCNoUp8ZIQfRw19ktyyO3VL3+
 piyk//9RNwxtwR1sPbAyhQjOJDhDT8Xel0GNc5zQwVpcUS/Iz1sOCGiUawpsvFCeGndJf9NnBSY
 yFVDbFV6/lVc7dFf0nGEj30UmhYK0WJn596Q68KaFnvGbA6obUilot1c4OEGw7tJFQ0XZCaFk/f
 L7SbgMFSoeeVwTr3+HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwMiBTYWx0ZWRfXxjsnUoPttYfK
 Xluh08/f/925QYEKVbvnotwZmzGad2ySe0cMpFXneTRa4Yr3yOBDHm9cPrq0gHa7/Ab39pKa3nQ
 fjBjCRyGaBRyvyT7RHMuePF1cVo5ctM=
X-Proofpoint-ORIG-GUID: _gKMz-TqZCDA-e-1skXDXVGsTaRpWeu-
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aaaae18 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=3oXqmhewsOmOp1idTXEA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: _gKMz-TqZCDA-e-1skXDXVGsTaRpWeu-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160202

On Mon, Sep 14, 2026 at 10:58:01AM +0200, Konrad Dybcio wrote:
> On 9/11/26 4:20 PM, Shawn Guo wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > 
> > Add the platform resources for the three USB controllers on the embedded
> > Nord variant: clocks, resets, power domains and interconnect paths.
> 
> [...]
> 
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				/* Same as usb_0_qmpphy above. */
> 
> Hm?

Will drop it.

Shawn
