Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB4A274FD0
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 19:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774899522; cv=none; b=XcyWpuRFcBRdDt+7HODq5LSMcg6wqyL9HrlvnwyBK7K7LMps5N4zC/886GMv44asTQm+SKae6fnnCDedTELJcET5t6y7BO7+H3XS6ZhNVbhscbtI0gNHaaAayt/CvgVNyI11YjzU37maQ6rC2UiQOTXnA2NagM458tDtHH9Eq5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774899522; c=relaxed/simple;
	bh=zoDazKR4am3Qud2rzuiXX6B7CUykUfYjPLvMCjP39wA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOW9y1EFfMqFkpUiYO577UQzPRHtQuiXdGTQEDYqoyV59x4+KUMzZKAYZVfaWC5IsNUlsOju3pHn0s2jdyg15deULcLX6CjKfgHRkqRjH7Bq8coomgHFDlXLevqTXE4BmlUi7Jc0kKQ5IGkNCq3pfYa9BlJ8pPBiWUTJfPMVed4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9Rs1njb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KUrWMDg6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9Rs1njb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KUrWMDg6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UF9WYt3722154
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 19:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gjZmNNPHmNuHOeGribBaDwRd
	i9Pdnrfn8eSrbuTd2d4=; b=I9Rs1njbL10R7SJ9bmaOSCSD9AX0zxFyjrsIUezs
	zIntxRO1qyFeHJo+FPmmHYDta050M1G8gkn6Sgp6ylVvuDRzyRmnh064TQXN1idP
	dgTW997pr5RqlJ98xzZ1Aoeg9bAL192jM+td6Wgz7bgd09ac6c1kuyfiAyeorxp2
	WMtfbmSxklx7vX4EHPYowZVn4WCt7KBbYKgOQASfy3Xs1JEmo5LbAkukLGgG8Sy1
	lkOXDVMeTJydV0wKpsdcRx0RwD/tpQ0+e7ldypunXffosvJ7PYxDCDkbi7hIoJzT
	Yw5lY84tTw6edpBZw6jDClU6DgQKKTMlro1OKy/dO/Lnkg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmtae1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 19:38:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b802961ecso65781711cf.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 12:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774899519; x=1775504319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gjZmNNPHmNuHOeGribBaDwRdi9Pdnrfn8eSrbuTd2d4=;
        b=KUrWMDg6nyIL6Lfp+u9imbRqmBJu2SWjjcaAA8pW1ynvLqMcV1vJen+veL60Z3YK2k
         5iHkxVqTnpzCa1kPPT7MSdSyeGvKXocvoKu8vYXRyM/yx4/EYyj6SBS65/nJ3/T3p/Ya
         GU7LH/AbP2fTxu00s5rzm5gv3BEnRwzCcuLmJndb3NBHGbdG8QlWsiFr3WwWrD71z63B
         xkggL5RcDnnGBdQfbQh5m7yPWa10B1FOrQdv2wiZNgoUI/Vy0P0TKJLHgPYJ/m064mKV
         LGHkW/arSgriOmONfQb6CRKIVtNlInPH4LWdkSyQu+wIUotjGV9U/E7k+tO8a8YG0ek5
         6Gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774899519; x=1775504319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjZmNNPHmNuHOeGribBaDwRdi9Pdnrfn8eSrbuTd2d4=;
        b=sJp0sG4CR96TG8az4pjxhiRchQLBBTpSjem/aAtGKGn2q5D+fbUr+LLlWy2xcJrW09
         fPuvYZVhGcCb0ZD88+GAWQ9c/U5e+5dC1bYvwetq2aFN3QQXEEMZ/qk2m+tZnDFobIoc
         MM/Fs2RCRNydLJgb2Hh9mJzK/zIPSGJLDGvezycmR8MhiB1lUzcmW2zIwvzmvFoZUl3I
         xrd0d6TmW+0UI5Rs7k5npeS6t7qogQ8ictKCYnoecfK/oKhl1euqIPSfxuwJ9/QARPPX
         str6MjVfJojBivXYZ/NOP0kOojIlI+mCD8u/Bq8HZraPKWBXWSa92EzJPd4cqISC20Xs
         PIuw==
X-Forwarded-Encrypted: i=1; AJvYcCWkeMrtUVM6GyP03yE3byHcLTBiMxRQcNrP2F2EwySyTd0JPAgpHB8/tjVrjiSqcHI2ko+kEI250u81@vger.kernel.org
X-Gm-Message-State: AOJu0YxGM6E3KOrKKnP8ML8xC08TG1xTuqT9R9hJewX+ZZqIBeN3Syt5
	X496dRK2tGw8CS1CfCvZDNHRAKzQu0ZomHFk82BsGmoWJ2mFrVFFE5W4vnUIlWVpuMYoDIcwioN
	46V5jw7cFLr2o/3PuETeaT8n9334epV2ZwpE0V0IjvGNVaNtn7AD8dwsxEcbW/HQ9
X-Gm-Gg: ATEYQzxnz+hoO4IoaDz9HGqkGDxKG2jzXayiYre0X4DHnIjh0bJVt0U0ROf5w1oNSzl
	7lAmyLoRpl0TKvzuoLfm9i6BmUQafIUN09WgJslBoSkHTJd2a8Xbt5xoH5kegXkwdJ4ZPI5+65x
	BcbLmkdqVgFfeHoO0yVkDLXremc9VTfkTQC7dJDUbx/hKkCfqDvRQX1vsLqs+V2HMvP6cjhUc1M
	P2C7kuIEscd+8MMwE/w1JI8l0znx8TtzgcXpyHSOowYZKsyiiPI3wIPvgvAOEIL4BwiB/ySxprB
	IPh8SOMTpmZ+wO0jp+RPNVgcnNEdpLXtKEp2EaZEo11dYtNSHqmop+om+Q26Jer0/0pG5uDKRbh
	S41NCMGzFiJf1HVfq5uLtXgJIq+Jjc8cr5U2CrJxIVmQn1gj37/N+Db6DpkIMD5bbVR4x8Zofze
	SzhnRzDhLqVyjZgZfkgM6XUJp4dnfcayV1KBw=
X-Received: by 2002:a05:622a:1386:b0:50b:1e5d:992b with SMTP id d75a77b69052e-50ba3960fa2mr187520961cf.54.1774899518877;
        Mon, 30 Mar 2026 12:38:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1386:b0:50b:1e5d:992b with SMTP id d75a77b69052e-50ba3960fa2mr187520461cf.54.1774899518260;
        Mon, 30 Mar 2026 12:38:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f435bsm1845067e87.9.2026.03.30.12.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:38:37 -0700 (PDT)
Date: Mon, 30 Mar 2026 22:38:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap
 QMI requests
Message-ID: <zk4b5fq6qlduj4sthdealnfwsb7iphq5wform3mhaij7pcin3a@2dpx4yp3qxyj>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
 <c5tdbllqrxxsviv7m2i3xzweyjhetv6wbpgioddaitig3tm6or@a22uaizux6nq>
 <fd33e4fe-8450-4076-b0cb-f09a7bb9cb11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd33e4fe-8450-4076-b0cb-f09a7bb9cb11@oss.qualcomm.com>
X-Proofpoint-GUID: dj9ovLmKgcYYBm8wTKxyqhj_RATFSoba
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE2NCBTYWx0ZWRfX1QN66fQv+pmz
 btj5ReKGHKszq5oyQ62N0vMtV1I6n5fxEqG7uwz/tksFLb+rCw4ujot9ImlVxjQ9S0PB6LWjLxi
 ausclJ0K/0MLfbZ+Ir9hM5ACLIc/JTki3LiHaWpLerPprri+qsR0VzTYitWfbS0YmTFJ8TXzM0Z
 2alZ3sLhGvkPrBG6juHY8rEeeszfXU4K6lmypY6+LEe/QEaRBb6iRBU6Kg9hHyq/9EmIsTyGAJp
 z+21NqpNWgey5x687FDLC911tcFJHGd7twJKTJYqqzAfgDd5WB7dYkuNWk2gjfxDUn7XLdGHjyv
 E3KZkQBaTxnGTW2b6tJ8BIdx5r9GaLT5WR69TuPvR9JXbbxARvQsg7LJTOKE/xc83KHOwNn8Cwi
 fuzLgeMQRL8FgnnAH2saPPFBzO444QnOgn+jge74sKRSvgyBIJmrE0i00E0Wbg4m2VYoC1MWfzU
 qzRSBP+owfYJdgYkhmg==
X-Proofpoint-ORIG-GUID: dj9ovLmKgcYYBm8wTKxyqhj_RATFSoba
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69cad13f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=RREYq0h8bjQH8LoFo6AA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300164

On Mon, Mar 30, 2026 at 11:56:16AM -0700, Jeff Johnson wrote:
> On 3/29/2026 9:26 AM, Dmitry Baryshkov wrote:
> > On Wed, Mar 25, 2026 at 06:57:16PM +0100, David Heidelberg via B4 Relay wrote:
> >> From: Amit Pundir <amit.pundir@linaro.org>
> >>
> >> Some firmware versions do not support the host capability QMI request.
> >> Since this request occurs before firmware-N.bin and board-M.bin are
> >> loaded, the quirk cannot be expressed in the firmware itself.
> > 
> > 
> > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > Jeff, to my knowledge this is the best approach that we have to solve
> > the issue on those devices.
> 
> I'm ok with this approach.
> 
> I need DT Review or ACK on the 1/3 patch in order to bring the first 2 patches
> through my ath tree.

Yes, of course.

-- 
With best wishes
Dmitry
