Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20CF3E3DAB
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038773; cv=none; b=WqUG02aTaQN1ATsX1zjmrgcI/SvHM6IOo/U1A80HyMsggMbVxdlnj+MWIZjMWhRqZMtsxDh6ywS7iTAcd8iy4en5bh98TWlKUx16HiHQF2hYnKy1Z0253Lrpf5TvdgPnWlLteaXP7iY66ABUgzI0009ZVuKJyLiuY335EzhgOCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038773; c=relaxed/simple;
	bh=Njs9tyb3D8m4OZGmINAbbtRppnbGqiI7vwhKUfDMq0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OLcJEIIvb1O0b7YQpwIlB2nnDyE5QVr7ag9V1XIDLsYVpL2PBniP42ltsV3gxd0sej5peC0NaZeaQZgOIXPcSdTFUCp6fYitkG0+/6ESJXgfvuJyyjSTyuHQfGpwaJRnGgy3RW6bvGua7VPfrchvzCxhfid2ecVFCz7SwtjcGnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PS4rqm3P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EjxLJli8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PS4rqm3P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EjxLJli8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314O6mp1562613
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 10:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	icigY/o4erm1hQ6wPL4lotqSd1rhrSmpE3CjS8+amCc=; b=PS4rqm3PjWOKLUxC
	fZmZSUMfFQbAXkocGS4eg3LQmoZUuKRadt4L2LHY2ulxThZbr206u3pO9CW3UceI
	UqxuOqvR+PJFdbi+KZv5/EAiCXBXxZXZupFmQMuLK39B1ekkfHVpsE9vxzptH+Kr
	mRIHuGhY4/qc84EWpt65VFnnPwEzHmGQ8bkE7pFQFOmErjbLwg26rrByfwO4uulw
	bv5JeqhlwDj1TXq6Nl0j1mbzEGn0K8qDmhpd8teX08ypCtTRpEAAe/r11HsqeUri
	iZa8sy66H4eL/mukdq4REeOVhw9MpCBeZq6r2NQzub2RTBo+OWNGrfOY6ZrAugA+
	+k7tug==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3sbcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:19:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a016b99579so11941146d6.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775038764; x=1775643564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=icigY/o4erm1hQ6wPL4lotqSd1rhrSmpE3CjS8+amCc=;
        b=EjxLJli8UVcbyrIh8P2L26RAsZaNbeigCRp65HilibDeJkAJLuqvDbgvA3yjEatPAU
         UI/HifMc9uMgNLUCeRy4ABllhcFN+//JBX1nER9JICTDu3BbhgTGMt1SAxxomly61hIQ
         LKbYVYnHfVVFyvNzCHNktmEllxzCi2K+GWt9jn27SjlfDSG5Y172/G0zYv0Gi3XXrd6U
         x1Zt0KLBnSGqdLch+fxV1GugzL5vRRJdRXtb4/2bQSKI5C0BRp12GDZGKDn+yZ6w+nTY
         Cgp8skyU5cMazc1v9yA0fq0DPAIyQYc/fCz6vKU8zI5TTW/guHHKyhY1b4AD9OYKtIMN
         8Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038764; x=1775643564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icigY/o4erm1hQ6wPL4lotqSd1rhrSmpE3CjS8+amCc=;
        b=RS3RcLdvcQeoaDhGT+9ajQxejqCXJ0QQeRnok+DEW7YgAsfCZfBLVgRNqo2gD2sKOc
         GUpQSVtUVz4NB+S167/v7wsn7TIvU9YA6Q/oRn6bH9TkQrW0472oSlmI3/d3uYcBJSKA
         rBI516VOBYSsWkkqPcIuSfFdB/gl8kbJ+f+AQc6V8IgmtsP1wl6UTHMXiAq9KWX5cwkz
         78BcrvjNJzTI9IwhoRuR2dxLjeKJuXf4XUqp8pRoTNsA6E4dN28Ibt/eMWz75Tgm8A6f
         1CIv1gQKAx0WzyTrwjmuE3EmVVhBQxsnCgyZkxmCe8kfdfWyJXpb/1jKH9wO1VJ07bVC
         F1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwWFLN0nP7Tn6Z+sRS3eHkRuU2T+6X2iZj2ANatcUY1JszSLvNcuFEU16tDZdR2wDzGRoLMGbhhZ6O@vger.kernel.org
X-Gm-Message-State: AOJu0Yx11uXdtIpISB6NZMOKUT1c6/pjGYh7l4qrnyuV1JH5oLoVulh9
	kGdfSxnFlOEEYQa7gSMPCntQE2qrUqdm3NbNyjMl4PVj2aAQA4EF7tOknPG8HEEyotNlqwsNvHV
	z3NrRjdgUTbdNxGaCvjy18pLTgBLD2CyGWVgCHDirLHhqPHECPu7B2WnQnQ04RwQl
X-Gm-Gg: ATEYQzwkJtVkZWTFaAXFyJCyk6K0tKNBZghR/wfT972bJ4dVvbrOCHX8I0adBFa8B0N
	DDs9MLiIhjiz2hNJuB0oJMiF/xUKcmbK/xkactC0hxZSq9gxr2yk3K8q04v+PQ9omPgvCx4oGAd
	rtd+oLY5s5pQ9xXNW2+bj2OGj47sY4hAb9hvwQ57ACP46gOyVO10OOoUGRlTjdI9GFTxw/q5LFf
	nzhJ3Btvp5VLVWEwvjfRtxXJWIgivPY+mQ0QcEYM1ANtVQvPCdzpYmZh1vofB8gFktBWD35p2mB
	sCHA9JrtMf9DxzAmKbDv3BsxnqcqQf7daLlEqQaREzYLopoA5//t4CkC7sQ0JFP4+2bQvkwU67m
	j8t3CzsoTxTsvq7MEuVQH8GoqZvPI0iuNagpT3QUbbH8p+SIE+5549HzARaO0vAgq5W31bsJVBG
	FqhR8=
X-Received: by 2002:a05:6214:5184:b0:89c:5285:200e with SMTP id 6a1803df08f44-8a43a55cfe7mr30042676d6.4.1775038763829;
        Wed, 01 Apr 2026 03:19:23 -0700 (PDT)
X-Received: by 2002:a05:6214:5184:b0:89c:5285:200e with SMTP id 6a1803df08f44-8a43a55cfe7mr30042446d6.4.1775038763384;
        Wed, 01 Apr 2026 03:19:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c2c28d97fsm23326766b.20.2026.04.01.03.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:19:22 -0700 (PDT)
Message-ID: <ce5eb817-ce13-49c3-81f8-8e28c40632a1@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:19:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] soc: qcom: geni-se: Keep pinctrl active for
 multi-owner controllers
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, Frank.Li@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        linmq006@gmail.com, quic_jseerapu@quicinc.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Cc: krzysztof.kozlowski@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
References: <20260331114742.2896317-1-mukesh.savaliya@oss.qualcomm.com>
 <20260331114742.2896317-4-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331114742.2896317-4-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ezjq59Cy1otQlUJYpy5J9K3uMBJDM2xG
X-Proofpoint-ORIG-GUID: Ezjq59Cy1otQlUJYpy5J9K3uMBJDM2xG
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69ccf12c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=z3Ex9-aFqVcHxkoEKGUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MyBTYWx0ZWRfX2apN5wlzif6Y
 7ECvbTJV0lRTRA7p/YtCnrbBu6IfVyrrDsyahAUrCvpD/LtLHLbrME7+nONpG8sCe+AruPV2DeV
 Lnd0nr1luLw/7CD82Xj5tOLRYWC7zyOwXErhcMkF2zN1EmOa0rABeyCurga2iaVkiHSBY5CGqjD
 2ujaSj9qu5daHSAaoqSdVj8H4uSbDZYU3dWoLEE3By6X0MnkS59lqoFnFwq/z/3CXoJH0ECjLds
 vNzxOWwtLuy4XQz3I/Z9tUoyknJSaSaLJ5iTotDFkuI53fwB6MZFbHjJhbJlcDXtqYMJ1Lbl577
 0NloNDbdBQsARBD1tYYINSPU08j8I/Wl7YTlc7JX3QYVM6lJ1MwLHnFGN/MQWNRImo0HNwb6ypB
 CHFdfN+QlF05AE8jVHbyMHfhXcR06v4KUaj69KV/bcMitJVAOJtPWT8PiKocNSmj9KDP2rylX+6
 8JCbRh434NHWF0ga0aA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010093

On 3/31/26 1:47 PM, Mukesh Kumar Savaliya wrote:
> On platforms where a GENI Serial Engine is shared with another system
> processor, selecting the "sleep" pinctrl state can disrupt ongoing
> transfers initiated by the other processor.
> 
> Teach geni_se_resources_off() to skip selecting the pinctrl sleep state
> when the Serial Engine is marked as shared, while still allowing the
> rest of the resource shutdown sequence to proceed.
> 
> This is required for multi-owner configurations (described via DeviceTree
> with qcom,qup-multi-owner on the protocol controller node).
> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---

[...]

> + * @multi_owner:	True if SE is shared between multiprocessors.

'between multiple owners'?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
