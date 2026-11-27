Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768720;
	b=eOEvkVCoqynJA/esEqASkrnSYQ+znDVAhYkcEypmzXuhQpsv3gsBQbVMIykSY1yqFvvD
	 Ym/uRo5x8MFUCqmGgQiMdcKeb6oRZN7NhvUVqz+UljyBwqwKsdxy696Z/xJccJLXMSljr
	 jvivxLxt6ycN0mPLeoK9xzyXJR0M64Xi/VFn2eELoyT4IGrgK5l1JI6P3fs2BhfbVAoaT
	 dH1n+4KDtifaaoS263Zek9h/caN1+UxfalFdQOtofaf4F0tmGESN1EzvejojCJFtyzSKs
	 EkUmnmmyNa/HkObuDdL6AWthDBDxJ6RD0sNus/RZVij7FXtQaXh+fRl9drvHL0610mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=;
	b=ukM/gadhiN1GKkf2CNLeh+g222mUq3ijOSUl5uggfGre5AngCwH/AeiQjVj5AAGOAkWJ
	 P0hjTj67YDOolhfoKqYwddPXCFRWE8omQlKQTvf5BVyVxFPabn2622EhV759p0LRHeEdn
	 L6PTFsDk/tXOjb2T7D+GixSrtRAYAyg9bcZpQv8YfHfsvDh06uckrk7DQB1errRZHdIe0
	 tJcC4Y7JC3ZOYdFdi1ry16C983NV0aTbOrt6fu6gEg8gM7ZRNibXs0jDXB8E4hloJmZ4w
	 0srdmQrTIzktUQaZbkGKpbokAoyAa/vRF3jt1h85dIiaQOzA6lBi1wy4pmQfKOCDC+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTyPVBKF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yc0Ua7M9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED97606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED97606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTyPVBKF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yc0Ua7M9
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GcWW3759091
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=; b=ZTyPVBKFf6tDcZS3
	j69kfanIfq0zT99v7awhutNb8AEGt7nf8GIY0VAOpuTNzh1bhCUSBQoctr8WRag/
	2G1HrQA4KC9hlaxz/OL7bABnSt4YVGXL8c9Jw6SpVjf0WXvs/AEnmyj7Ttxe3+LZ
	DQVl+svr3kkwl8pELwitzqTuVEEnUR004qH43ii4KBOhG3oFEPB7r6M1I+M3FW87
	eFDUrjnf/5wR2DXvWqmKUVt/bF2Ki1kraRRw08AEZG6FmOV5vMlMT1JQQfiePK9u
	6n+jmQEGexaqqDJLB64/b3JXWMqcy2u6Lib6wYiHdMbgRRAeqzH7x5EuBEC61M50
	4Rzdpw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6rgn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:38:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-550b1b21674so16844971cf.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795768717; x=1796373517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=;
        b=Yc0Ua7M9lQ8To9fWdrbilqI9vTQgtYb6n4IdOcdMuWFxeNtsgnFGcHu6nWCAF8u91k
         7jhTeCisP/dghy1ILzJKVhurn8NUQFBOiLpeWXe5HmOgnoc4l7r7YwXwHmH4E+6O2nD6
         QYLyEBJB4Ojo/0BeVN9SFQtHoNJghR50Hb3vertIvzXsY2TXf1rLxar5J8Gyhn6nFbv2
         McXvyuQdYQWrz5VPnE+Ql1SFG3ZZPBWArFkigitQgUai5nNHBeB+LhnxfxhcpqI3o5A6
         K/hwp38u9a52Q3pyCCKuMXXgnPm3UsIau+MAWWYvrSWkvnNRzkw+l1jgVS+sso5HPIzv
         6fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768717; x=1796373517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=;
        b=mjLkcHbzOnr/dgm6sc+58tC+DRVsHUgjQr7T/ta+XlZmxroIdsMAm/4/4Mn6yj+RcV
         7Qp1zIDJ9lc7jCrbWYKx+h2jX4L8VPlkgmI3hegekDTX9wi2e4N8pYXO8YVPizpRglcK
         Q9krmXZWm/UT9TitfJ9y5sJEJJBrq++jKRmEVw2VgU8/94Cg2LbF6kabU43+2vEnHeEH
         WdmrO3ITARSyctWc5n+ItM+n9s3lKrzqb8xF455C5no75f0CqjytgL9huBeRcRRdz5Tk
         v/Y2mrBFVHLVscDLPq7kSMjzisQ8xZQapcYgwtK+h0MXReHXnFzq/UA3aI/848uyfAuj
         z4WQ==
X-Forwarded-Encrypted: i=1; AL+hErGlPjWtIaHYqHSnI6dQkytbNCAGnRRqhjMjSgy2bAgFLadKaPaftUI1CAiqQh6Qh58rzpzWggjWkxkR@vger.kernel.org
X-Gm-Message-State: APuU4Z+GEgYNc85jOJ1XebwDHlUasCB4COLxVxKdCxFGoz7wDZQLy63Q
	8FujyVUMEYkcA+/n+ybgihxJADHYHSm+bhb1M8VZZx3fnAsa8qvlDw4KJfoKQ65dXDCb8IiIDol
	lmfU29ZlzLN86ZKC2vU1A6HPdPtwV9YNlIWGRyw1nh03+BffZuDM1e7mVlPPTBHwt
X-Gm-Gg: AZFdTZci0lfc7qRcfOYvChNAx+GtmgIlrNb8voi4uaXQijr+smcSBiiedTbpZoVbOQQ
	POowc8t89FSXkkXLs03nabYix8r+8F9Vu08ruV7Pyakit1ccmB3QX8J2VGw+YLtzUb2tVSqpjO9
	xZnVGzvhK8wwy62DQpYroXyNYmm6+UpjCzbnyBQhoMbvgtHXR/QOu/27nDW4kHTZ5az/BHuPQke
	+MnE97vN7Ynp+8CVjN4301u4uUz+n4SgdkFiktCPYP1raB7Nr4bez6fgFj3s1XxgU75ptN5Ei5S
	xvDCnmeX2Os05UVHUEHXUDxvX09/39xXeDhg0xjjri9hia0Mk1v1O4rQZA3588c3cJ0VQWEdf3/
	0OSbkHiGqniPX2upiZmKgBwtXaGNPjqnobN870aYdmLNYFkL7MLB654eD9xqB0DjQB8iUlvk=
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4421017085a.5.1795768716767;
        Fri, 27 Nov 2026 00:38:36 -0800 (PST)
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4421013085a.5.1795768716319;
        Fri, 27 Nov 2026 00:38:36 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeca720sm838130366b.53.2026.11.27.00.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:38:35 -0800 (PST)
Message-ID: <dafa31ae-33c3-470c-bfd9-ea16cf34f583@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:38:33 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: halliday: Add gp_mn and gp_pdm mux
 functions
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
 <20261126-halliday-tlmm-gp-functions-v1-2-b8543d6a83eb@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-halliday-tlmm-gp-functions-v1-2-b8543d6a83eb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dABybhOUY96XWrktwUvbKl2DSrJiKle5
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09418d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=uTCT-FCyihPU-J8YwhkA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXyAiFQK1WaXyE
 SaqbyCV396kfa03XGquDslGPk87L0dtalPUpSZlFRVtY9EQvs/fi8mmeePXfZVF8JqVkVSyxFsJ
 N0bKFDMGhBKzwGY7rcd19gw/lhc+Tgo=
X-Proofpoint-GUID: dABybhOUY96XWrktwUvbKl2DSrJiKle5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX8gsdBV3j1ZzJ
 sMw6tMSsqiJWeKubH/O2Huv85Q7abu5AaYFb3wnuTkCns8ckt5cRZUflMwY1+4L1v3+xSgwdLTR
 o5A9Cj/O/g9PWR7v69+kzb9C4VME4cSkomWaMH8bcLfAfN1nbFiB4SKfYFO2HrgpZWtTPETguti
 ErdN5wI0Hms5ZCbgIcCYeBElELReRRnzxw8cZNmP7l1yRn9/+xJBnnMgx6Qu1lzHTobPIBH3UTd
 QfjyIaH1aPOnWFPtFA2RZWBMV9Vbo7qYC0hFOtXZW6D5+4e4v3ICqVHeuxamHKaus59E9P2WhFv
 DfY6as7odYkgumi1yIfn5EHp5qrM4YuxZNzbxikG6qMx0kktfzNC45Gbk7QSzagCRaUjSZnClwM
 Rv5TsZpSy9uAhmGe0NixXeAvHvhf5fP24Cx2x5JyQ5MiNOxK1rxu4ckrGGQ2bf46xWO+9KwCMwx
 m2cz6g8KVNyzrn+eIIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

On 11/26/26 4:22 PM, Stanislav Aleksandrov wrote:
> Add the gp_mn function on gpio63 and the gp_pdm_mira and gp_pdm_mirb
> functions on gpio35-37 and gpio88-90.
> 
> Qualcomm's downstream pinctrl-anorak driver does not have them. The pins
> and the mux values were provided by Konrad Dybcio.
> 
> Link: https://lore.kernel.org/r/84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
