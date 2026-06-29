Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420C33BAD9F
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744237; cv=none; b=tsUgm5pz9O7jC9Wu3dgSLT6FZaXvBoLvRxAG+Rp06qe4QDSBvOF/QzAWE1OxQIn8ZBVwAbwJSk5ks0NlXwXX3UjfMvIu/XlXBFFVOl+Ekp+7P5jUdAEwyoVC56NpAT/biTQQjcYj94fBrOWDP8SIUV/+9koItDdNIeJOIfS/rSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744237; c=relaxed/simple;
	bh=Uvh42LppJ1Epa0CUMtEmloHLr+G5459XIkzs9MlNxd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=efVcvdyEgDctdjQ9jc7ogxgrXBYiYBtwTfnTopLSpHdZEGxypsCEk3y24/f5dAYMk4OnOVWUooHYJZrsIJEUcRyEdq7a779MQMkRBihgd78wHNXrTiXZOYW2JTV6oKDQTm9fiwFv7Uc3nwEn8Pmfcyhh/NLCyHG5P5lPT9dMYew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGAbQePV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frwgdAfR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGAbQePV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frwgdAfR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATRgT2592780
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxrp3fuMsso2g4/1vO5uXuJ0y7FJ8lxgYK95RmV3DxY=; b=KGAbQePV4UDikDyI
	YaYXzsdCPzD+LrFcLUa+YssKYpZtxeUTDdN4o+AkjMLwxZejE4N6XuChkB8IGXCU
	fl6VHHChGD0TyO0XPJ9sp6oz/UIBlTrr2LBJ9kLHmOugCk794XrxaUH9gOzZBuzl
	9bPqaN+wCXO5O3mIVyz9lk/r1tL2kZ85CaLoNoT2JlX/6F7GWs+8p+o916w1zRvy
	etIB4yR++yHNCkfJSJ4thvOrDb/sFR9vdMxwejXKec+Mz/7maoxadpB/nFaQHMtM
	IYlOA+Q260uU29ixNXNBWBoL8TMbL7W6vG3gx0/4GhCpvxum5aCygvA51wUoZ3o3
	DC/DlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vj6d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:43:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92aea0d801dso506939085a.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744234; x=1783349034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sxrp3fuMsso2g4/1vO5uXuJ0y7FJ8lxgYK95RmV3DxY=;
        b=frwgdAfRPQzXRb9aMOSIA7uNYVDSOhsimK0SS/BN0b5OmsgAtp++2gSjKSSQpmIh0D
         fGJBly9PZnELPvJLhQn9/gHugR4GsmYmcKjA8HdpHKDW+2oyS4ZjAI5QaiVcaHHhSplU
         OSbjwEPA36UoDor+fHny2wRJVs+No1xXTc/uMMl/qQLijgJwNu85IH0zCMM4vSvh2UZ7
         WElo6LRlPheIOS9IHD1t4k9fmIyHQYtot7L/TaWPw7/A1xl67QTE8w2GFk/udWdW/+Ek
         OOZV2Unws+EDCBOAAJPkx5wGFYFkrRteo2f502DMDuvN6aYzgE0lncCYMd4r7QXEB9pC
         tCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744234; x=1783349034;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxrp3fuMsso2g4/1vO5uXuJ0y7FJ8lxgYK95RmV3DxY=;
        b=BSLTY+OeFlF+jqQrYbWu1zVeLymuKBfpELpR+vFyfwhANi0a2pFIp4WiZTkql1aqND
         lqGrdbBBcxa2gXDLBJMzxikJtPKaAGzCUgUlWXWqIF3I8+tHS3Hjen0QDY3eNri90ORU
         Ytdzj6qVDV3gaj9gpgjrdTG/1TQVxXxsku3eoDdo7RQBsn3tOKQW8XMs9vNgGTu62kyp
         UrQ/gnuKCjHUhhK3N3DLnKbVClwK6Lyy7TbsNrPrjlQKihyG+qPGjFpBOjyZV6JH3XJi
         MzPn+UEr8eRZ5fOPlOEmV2V1rlo5ISVC2Xe+QDnxt0KNVXOm4ecyPNgmHomV84r09m1c
         x4Jw==
X-Forwarded-Encrypted: i=1; AFNElJ+8agyEZ9uNrz9od4hqKJhBVKVKf4IPAMgOUKIKY2o4bAE+j4hmJ1nQavAEht5qHYzMPtiRHzdrPsnr@vger.kernel.org
X-Gm-Message-State: AOJu0YxMVqcZanbZm+1CBrdqTeJOx6UvfC/U8FOyoIGecdPyZMDDS3M2
	tgEFT90+7TSgTNXEO4AhByYIwBrrg2PgitV46t18SJJLV7bKFsci/26CrczfqUkZw9pIXM8Czs8
	Dz2vmEsNRdOn6nOqOo24O8zQgEY1hQhlwCDaoclhZLyGg0yAJgM6N+weJOuwC3KXZsKEoG7Mx
X-Gm-Gg: AfdE7cn+5Cwvo0fbS0BholZ7tozRDKY0CG7AhmQ3dtTmHGX84HyrqpIDJvZtOzSX6a1
	ovLkrqqgaM0SeB6usQNMQrMRBCY6uyWeT3HTCSTYCPBmQxuhp0/S7QNqJ9T3WfwK3MFoxS5s16v
	t1xwxs4F5jfAS1qndOpZEDJW6da9EdQ18uXXkQljZRZeXzdIdDFZD1wSF2tCJ4YEWla/t7ryMNe
	NeMpW10YtyrpSieu1TuoBfkM3tfiYuRTHS7wloWPuocmTkLgGZ2dK+XWs30VoO6/JSPG6xdtSDK
	ftBAyqYFR4RbM8Y2ZbgqODp54ErAnKD21iStbBlkNHIdpLWDdBwkTk5+wlhV4m2JihdMgHdG7pq
	twWLm/5HcRLl/EChgX4C2DGItZbMCFTVgF05cDDey
X-Received: by 2002:a05:620a:25c9:b0:92b:6805:9193 with SMTP id af79cd13be357-92b68059487mr1542931785a.59.1782744234505;
        Mon, 29 Jun 2026 07:43:54 -0700 (PDT)
X-Received: by 2002:a05:620a:25c9:b0:92b:6805:9193 with SMTP id af79cd13be357-92b68059487mr1542925485a.59.1782744233945;
        Mon, 29 Jun 2026 07:43:53 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4702eac30f1sm24427644f8f.8.2026.06.29.07.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:43:52 -0700 (PDT)
Message-ID: <df248123-b8a7-46a4-9f0b-1cfdb50306e6@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:43:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Add Qualcomm PMK7750
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260610124119.253456-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260610124119.253456-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NsvwVNOQ8enp8xZekI2eTZ6kSKe7e1oj
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a4284ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=stQqkvZHqmwFSV_nB7EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX5VIe8X9k6tbA
 YwT2ZZfayr6h4tfZKewJ/P3QR1UuMz2f6bSYuw0HIHZCigekq5bOFCOBrxqIE72nITaQS0cn1fN
 +1F1VgqtDJsASdvKR8BUS5n4GIDv1Yw=
X-Proofpoint-ORIG-GUID: NsvwVNOQ8enp8xZekI2eTZ6kSKe7e1oj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX2rRmcSj3qbW0
 cBUWqqq3IvgrCDNdP898zYQrZSrT0gJbTs36aBiY4Q8pWjjjcGsAjjHLo2mcRIj8pGd1BChsa0k
 anD0fGXWK/j0/wicb6GhvWeDNTUuQwXRfJv15G5oyvH1hfo50L/Rkp2t3hSpTuZU+U0bF230IKM
 b/Cw/U2m0qmPL0Sd+fC8jcXnbqR19BMGA6yje6Kex73JJCL2FgPBX/2E1PY5Nbsy851laIntABi
 N8qRCpBcx1fVbN4KJAQ9ui+Eq26RA743AWyvY0DBFuhtPu42D4odhHLbKxR+EGjAFWCFQ27vDw9
 IObQPtTXET4OM5d4r4ARJLdtPtddQBtAxMbaSE7vBG1HGBYPnulferKiNLtDCNPam1d41eIPo99
 eRC0gwHpGCLohGgkg9Q4EUc1rYrdJNAM4dR1Eb7woeTjo6vxspYw3Fp6Y2BRCKjudDfB7HsY2mB
 NaYgq+x5ppT+mmlldxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290122

On 10/06/2026 14:41, Krzysztof Kozlowski wrote:
> Document Qualcomm PMK7750 used with Eliza SoC.  PMIC is almost the same
> as (and compatible with) PMK8550.
> 
> Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +


After some internal discussions, we concluded that it probably is the
same die as pmk8550, just fused differently, thus does not deserve
dedicated compatible and patch can be dropped.

Best regards,
Krzysztof
