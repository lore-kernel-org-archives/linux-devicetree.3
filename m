Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598665;
	b=pc1ByjXCa44CxbgCFkOda5VItTs07i/7eVaV3zvg6wXw3qeAxmEc2KT7ISFZz88y5Bi5
	 UIUwr0UENRkTexfVVAqv7HDZ9HX40s41ihyze5FtbGodT6c9ggUb9nU2+FE8R2eAIfvpK
	 d+/e66Vo/dfSi1ScJuy4y6CIOsOSguO2/8HyuSiREVPb/dJvHslw9De81WDtaSga0mYN7
	 vsDyp8xhYptvQYoQ7IDxNpdJo1fc3XdC/pXD7Pp/H+0kX6ndy1ItuB+oVrJ+xTuqsU4LB
	 ColJ0n/NNMcebNcwRlcCSgI+mn+IbSG9DSgga8CypHmbZWv/fRc/RAMBs9OeM9c+pJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lGmW88CnQl9hiGYpiWfwaSM6NmzBZwZKuT4WR9HAtaY=;
	b=j4Surmem2eBIZVJcZ9Pq2QFcpp300MVrECwxOrgHfi6cPU6vSY7xZ0GMcjr08YNQZZfI
	 3fWivHTRe2Q4v8qU+1caIHn+Iu9LWeevw1DM+n/WBnI8zl0rMSHveEsJNVh9eIRlVBbei
	 D0mh6/+Mtfckc8/TJe/54/+LnfvRnGatQAJgG4pNvflvvj1b4btkAOXvI0atR0GoBYHUK
	 stbClLJjWsodYVpnXsWyRXENyi9wgPzAgw/t37L6rgJLwWIAqUIScv0ZDfkcXwqrBysTp
	 MM8JxhvgmF957teCm+3LhojRaOzUIxys7zsN28tY1XO23WHaAxhaXzu4YvKkn5Xd/yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=izRxgdwI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H/1z8zyP";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672BB606A686
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 672BB606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=izRxgdwI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H/1z8zyP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9F9br479591
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lGmW88CnQl9hiGYpiWfwaSM6
	NmzBZwZKuT4WR9HAtaY=; b=izRxgdwIaLNM3iHxISVTA7KguTx+kGEdEBtikRrK
	MhyFqFTUXmuohngSfhyjMQRqLV3C2Ov5posISQWNN5zezJZZL9hIGuIvVOROcp0l
	zbEfCI6lbThcjsG7ynObKk+W8dQiTQBCvMALhZkDTeD1hfv3VmbsehFvfmxY+b3Q
	l5zCWmHk2e+sjRBgXwvkQprmuFSpW2AF2TBjYqVLjrZajzE08FdFxardJOgfOOAu
	IGYFJjRZy6fnKC8qq9RU73BEPpDFgfeXq7PKqxHFE8VFVdnkkBD7JeGKcyZUth0C
	NcH3hNd7H9xDXPM9enm1j9DmL49pTBpjt6nDiPyB+/9ifQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnr20u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:24:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b44bcdb096so3930557a91.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 01:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795598663; x=1796203463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lGmW88CnQl9hiGYpiWfwaSM6NmzBZwZKuT4WR9HAtaY=;
        b=H/1z8zyPwKf19jB4zZimqLWeS7jZx/NBhViUyj0b/kkF6tjxH5COr/MCH6AEGtBSs3
         xm/RirvVu2Dx2+Ahvk1mCR2WTkga1gL3KrQvcIWOhCldM/pZQ9+0jW2rxXnmxA7jbL7S
         rC/trXX3BsR48xSUYrhDhg9ORVKVDEgOCtj83FnvGD1txO7Zwo4ovNIBe7/6laEBkeiU
         LnUe8iXM0Elc1hOwbwqkHQHCY1UPYeFc4KP5F9aRK+tfcRzwTWtfwWhHkrwbguqBA2aY
         RSAs8XZhAo2ffKhA51N8nucr/RBwLcFmF0eidKCZ3jJHzLM8T9A6fbmZbZ2Az7+JD7G4
         pnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598663; x=1796203463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGmW88CnQl9hiGYpiWfwaSM6NmzBZwZKuT4WR9HAtaY=;
        b=eQSj8z+CYSAlodMibrCuUjC0eYfBYMxNsnL4biZ17dndVHyXgx8DP2/RinqpNwkPsF
         C4C/RL4v89a0kq7tz0UQegBq+Rqn3CAlHd2FpRLtyL1DC7Q46y9iOpW9xnSl26WBg4x+
         u1Aj0oR/Cft8LIAyxQpG1WFAjhdLiH69jSHDtFBrQ8m0BagtarToQT8aRWiwouVEYOr/
         B5n4tTSw00v7Z+28rr9DhaPtne6UJpDzFS2JpT321CjJDVjBDCWJYBJPYEblMJRTJfon
         C9ihlOldKl3OD0eu3CjkYH5jyHOt6DdbbjEGJklo73X4Q2u+LCK8eeVHZ2tmRxoWQqOm
         YLpw==
X-Forwarded-Encrypted: i=1; AL+hErEhE85pdHP06qrDudjpswpcrYxQnGyKhE2v+e996PpxjEpSyNOvXrWFdyNkYAVqbIz/g4ZIswrOxQ1F@vger.kernel.org
X-Gm-Message-State: APuU4Z87ShEz1ZlD/bQHsg98/3FFMhZx3ojHDxBG686o6dc0aRAXLCKP
	C6jUAp+RWlxUyPcEzcIT/F+3ThalnwKDw0AbJVjI+29JNmJwJZGwm8d1HyFGbsHhma2YbqIrooe
	Q26dwBc4lgAt8doP/Od10uSzIwGW2oka/kX23LBNysOwi27NyfjywXsRzP9hWqLn3
X-Gm-Gg: AZFdTZdlS9wqkcn5L+RG8r8zQPqAjSRbmzb9sqayFTIdJbeBnlksHh2CFVdKM0LMWN1
	3D3l43+vt43dWlypgtFFGHKTx5zmeN4fohlKr00k6mKi9BvZtLiYQAhB1nLcBRyEhiZcFxbH/9T
	AauHjaYHSrsbu5TBYY8QH+ww9vDUrT0pWXKU4blqb3hijVhCtB54k2AGX7NYLDduCBCjo5+ZcMl
	mE1+Ml4c19VUcUzY9c4nBL+SilRv59W6HDGwQtJk1JOE0ug19MlqL14ue9ZUYzucCDPStP6FvPB
	/bOQnd7SQgtf5KwZDkMhDuWkh0Bsq/zniHw1kzGYImHfPL6VzFAe0GBdFd6Xq4mSK9SNC9HwW3S
	4LuIPoqRajNYFWdw921HXvIpAR3NT6rlgcbnTZJXU+wozNQ4utfnRgcz5BvheG8aVTOObtu2Urg
	E=
X-Received: by 2002:a17:90b:4a48:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3b41c7b5fb3mr16297575a91.1.1795598662739;
        Wed, 25 Nov 2026 01:24:22 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3b41c7b5fb3mr16297542a91.1.1795598662124;
        Wed, 25 Nov 2026 01:24:22 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm27225013a91.2.2026.11.25.01.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:24:21 -0800 (PST)
Date: Wed, 25 Nov 2026 14:54:15 +0530
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] arm64: qcom: Add SMBLite charger support for PM4125
Message-ID: <awapP5FP902jwSJ+@hu-raryan-hyd.qualcomm.com>
References: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
 <8dd3d211-d5c9-4a8a-8b48-04de60922b22@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dd3d211-d5c9-4a8a-8b48-04de60922b22@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfXzbfY1lMpTOHQ
 wqaf3LcuGCGeF09CgTUr09l3c9ifrSiO0XnLSCFhFXgBEWNYumrDz98xpnVqqm/9P3ZgfIf/4Oy
 5Q0pHsEHy+u54BWku3ZUyz1W4wjz/xY5RsZbhn+JR9PLm+39Vc1KdiL8aqNtAlOfPK+VZI63EBO
 Ej12JQk6TFNjAVoH8Rfw3Xg8h+5S3qO4/jxethDUNzM96alh/yDJbISWIh3kfetGJfsRGZy9lBg
 w44V8oOZzru9DZBb/YWf1oFuWQxVgl3V5AAIS9G35rieAQMvuOH8vXrvKkjogxzgKcBUZSBUCMG
 DT9CIfgtRaZZ7osfcxEnZzzPO5KoSjfWsey7AUNAuhFO+eGzye/G0jqZZOof1yjAf4S5m1GH8lF
 kP9RglrS0RkQZtmSkI8IWMi1hrkRRq29Q8Zt3yDxkGJHYtNSWJ3jKGs32cHjBKztYQSPHIKhiTj
 Jg1Rd4761dHJGjNhNqA==
X-Proofpoint-ORIG-GUID: udE-DV1rCYQtl_PP-T-dnUbaxBp6YW6W
X-Proofpoint-GUID: udE-DV1rCYQtl_PP-T-dnUbaxBp6YW6W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfX7Ncziof5cNqU
 tGP5cbtoxKP0CBFJNmtUjkVvKOzHsEqsodgU8EwFoydfUKK27QGb2rVkyCv2TNXu6tiIofvAXBH
 G/dUdCSVXF6mQ5O4s1+8SeTI1bjfk8A=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06a948 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=kZJHlUTYguviTMVrfrAA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250037

On Tue, Nov 24, 2026 at 10:48:02AM +0100, Krzysztof Kozlowski wrote:
> On 24/11/2026 10:15, Raj Aryan wrote:
> > The PM4125 PMIC, used on the Qualcomm CQ2390 platform (cocos),
> > integrates the SMBLite switch-mode battery charger IP. The existing
> > qcom_smbx charger driver only supports the SMB2 charger IP found on
> > PMI8998 and PM660, so PM4125 currently has no charger support at
> > all.
> > 
> > SMBLite is a reduced-feature variant of SMB2: it shares the same
> > SPMI bus and overall driver model, but uses a different register base
> > layout (five separate SPMI peripheral bases instead of a single base
> > with fixed offsets), a different battery-overvoltage status
> > register, SOC-based recharge instead of VBAT-based recharge, and a
> > different JEITA configuration sequence.
> > 
> > This series extends the existing qcom_smbx driver to support both chip
> > types side by side, selecting the correct register bases and handling
> > logic based on chip->type. This keeps a single driver and power-supply
> > class device covering both SMB2 and SMBLite hardware.
> > 
> 
> Why do you have unexplained/unlinked dependencies here? Why dependencies
> in the first place. Does it mean this is not reviewable?
>

The dependencies added are for charger type detection, without that our
driver wont show proper charger type i.e SDP, CDP, DCP. I apologise,
I will remove the dependecny in V2 and mention about it in cover letter.
 
> Best regards,
> Krzysztof

Thanks & Regards
Raj Aryan
