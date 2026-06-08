Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDE6365A14
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 05:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897130; cv=none; b=NZ75yakDu6KBerGTMTfZ9d8M7CWkDOcS8mmSwH+JEz1wk9ZC4MsmJJz00VLqslVDVzh48yns/sknpo0Pw99xJHPocUvev+PnYQkXdFmmcaLjgAisPZPmeJFxo07/jUORDtryxaMbmV5zCzd9BVqGsMpFHw/pAmIf2HMIi4LZBQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897130; c=relaxed/simple;
	bh=rjBsa2MHVLkDXb2CoxVBdEaMLVAQILsXguHOSK1uoJM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BWqY9TorgoRdyk47bKjbUuZuk8OLCAt/6IZHRrBAJygy+FQFSb0L5Q4u72TOVXesLrplpCtOJ9nppGDMrlpX0Wj4vPJQT4GI25wltUEXdkS2RXXqlcphmwEacaVnct0HiTfguGmkdX7GhPRkjCJWAGF8EdKKhWx+tGIROolaJ50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pku7S1tl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFvtimJ7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pku7S1tl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFvtimJ7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GkN41933565
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 05:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rjBsa2MHVLkDXb2CoxVBdEaMLVAQILsXguHOSK1uoJM=; b=pku7S1tl0aKtOZLO
	sTCvvATJkYW0dP4lXtEBoX6RmnnJ2pq8944hkv5qfUua6izek2zHLLlfFspqm5c3
	GdaXiVGSkn4k/XoyX3hPj5ayrTxRxqd0tFWUsD/tWSvxhOz2PeyVttRHiC4pG3ab
	08sjmInFkmd0B1DNpaZuKanaGf7xw+b+XowmBlEICYAe/ET00LEKzcfMc/tf5EHm
	MNaT0N806pkw2Re/MrdAvlBiXRrVF1UA91k+hp14JBUCBO1IQBXDjOXEc8iaMHmG
	rWSmUxAO0NAdK0TZv+wrN17DHwgpdsL0GN5m5YWq8gCevZizLGJNS3pnKBcO9sro
	AIiJFQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf64s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:38:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422ca754d8so2613335b3a.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 22:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897127; x=1781501927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rjBsa2MHVLkDXb2CoxVBdEaMLVAQILsXguHOSK1uoJM=;
        b=fFvtimJ73w28oQ8o3+yO3pDEcfYXueXc2cKmjwmOVzO4jYTAXmO0vStjldLxVoM+91
         Co2Q/EqvdvxCfEA4CNI3ZW0VAvE1kgoTitLg4xdcfYEi2MYTita/S+3Jjc42wnB21Sul
         Zv0UriW7Re9yNy69t0ussoaVH3J44f/fdd0dGy4Wpa6nP4WFK/Pz4OJ0GhB/TpHIF14h
         JTxoKVUJp5cRYtxY7wmA9/GuYzZ72UAZ61ehQfbbomomm22xJ1mr80j+UujK1iomV4yI
         DgKO9Ybc+DDq/P2XYQcnuXA/VnyxAgsTacC5kgVBLzzNdleYTvAG17HGQ9rRfSGa7qHS
         Oj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897127; x=1781501927;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjBsa2MHVLkDXb2CoxVBdEaMLVAQILsXguHOSK1uoJM=;
        b=FQE0uGaizT2vCY4lMZ58WUAgsQM6QKTft6tuiQOFgm2RcqEiXDTChx5Z7b9a7X0Gio
         npD7MihaDrmUYV8OHyV2Y2QVPi9Xy5Oa14TgUHpwexOVv020W3pdAWC6l5jmI3/ZtX1a
         8mqyW8LzpctgIwNNq5zIK89IIsTiIaWDPVlXiNRwU0EJXEuK5Wz2XqVZFgaAQF8jILTS
         XY0qfGUPkwbvLUbb9l60vVXthfOQAlqimu9T2s8ia8ekkbxSAL10+icKxS80ZtZnKu0Y
         YXP+5WN6hyW2ipcU6jgIUlII6leVLsahKRXmxXEdQ0VpbJMr8bp4Yn9oSVhv9KMiC6tg
         kvng==
X-Forwarded-Encrypted: i=1; AFNElJ+aSiF292wyTEGdFKEM4IWFSNCJVfLnC64Ai9wuttNCJwuXcSGu0vuM9hGHPN0RC53lb/86D0BNkMqG@vger.kernel.org
X-Gm-Message-State: AOJu0YxoPY2VTky7amtkcc4hIT1w+rbKSZ1KLPl2RXv8hGiTqZy6kf65
	z1sDy0snzAQxjWzQ15aPk8kIJMdIPX9SpvfE/FrTyh4SoQM2NHAEEmMnWXTeMKOGP1DmAS6SLmD
	Y1o4K8WI6Yx7RQQOIcO+ck7d2xNdfNfkKS/00umL1ofgb1mhuDPbqVrEc0DLhEJav
X-Gm-Gg: Acq92OFL3+7t6iXcxRhzBMFArXxhIq+qYyNOQuetjWhJbJwUZ4nzmKrjygNBX2fAKxo
	viZP83RqogEkFYwemV1QJTYR1oMrunaXtRfpdURHlgCC6DhnD6gtVVSaG2Fj7iiDgjyHEQMaiFw
	wfnUfRLxxhgVXNkPwq+PhInuzX6DnxoXFYCEYYFddp7o8HZIKl0wNruNLOgO39odn1RhUCOvX7A
	bBuV769j/ntDwTpU8ZTrpSh83Pc4doiR0uHB87sJgP+70EutB6/3Q+vyQVF/y3Ibx6lpfBHPG3B
	Sx/jboAwAomPsyAiUhu1oLWhI/SoZM+Mwky/misclnPGfF/aEiZtfrAC0+BquqAAfpQl4gcKLz+
	LQ1509p8tLAjYrAINyLf1t/2iuOqKQX+bqgL0nroU/L2I0YG/kJBVnvwIqZSo6tfK
X-Received: by 2002:a05:6a00:1804:b0:842:7992:bdd3 with SMTP id d2e1a72fcca58-842b0ead88bmr14472658b3a.4.1780897127155;
        Sun, 07 Jun 2026 22:38:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:1804:b0:842:7992:bdd3 with SMTP id d2e1a72fcca58-842b0ead88bmr14472632b3a.4.1780897126766;
        Sun, 07 Jun 2026 22:38:46 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428222263dsm18557943b3a.2.2026.06.07.22.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:38:46 -0700 (PDT)
Message-ID: <d35a0160-c0a0-155c-8f0e-65b1b7eedf5b@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:08:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
 <20260603143923.58E1E1F00893@smtp.kernel.org>
 <4itwv5frj6gqfib4bzbie5o4zs3oea65vi4hosyaeitdagqdek@4be2jvik7csd>
Content-Language: en-US
In-Reply-To: <4itwv5frj6gqfib4bzbie5o4zs3oea65vi4hosyaeitdagqdek@4be2jvik7csd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a265568 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=s3xQa8otug5672-2qowA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: QtTxqLuwxfp7SgI0OpVPRSbAw2Nc2aQi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX5l/2e8ShbENn
 TMV35IYcAfEQ9qQ0F8GbkItcuO6h6C07iPfI35Gqn5F2JLyvobNifxRnN3bYjJFjFQ4zRRp1vcG
 VD4KZL4kZOR/13VFD9fld+Q7QqyGEHhtHJJB5LN3+gxevRmZVPdi+YnSsZ+zSIw9PXcNUFDKB4T
 7NthHvy8XKianvck6sxUw1ZlUKYBENvJQIjtMBY6QGGlCqLpdXQK4zXgZ4ZEl6gL7LYlhACzjtS
 OTaqCRf4OtiUF6JCWbvfeV3MgAEkskhme/je3kQii9WSTC7ptt0SmxMic5eb7bTWcT76WbcUhzN
 Eh2ny0+7AoLRIbXWhF3+qGN/CfmSepyz89naajJ0jQ1TR7X2iRBoghOqCNiHv7xPnGMR7QcDbA6
 HyD71G6ySy7D3JdNwbLQg8EKuEcZgL17vNhaKJkwHw2G2fqqZLRJllrgjW2PjSCMuMxz4jZDXI6
 piLdWRKvtC7bJ/oD1EA==
X-Proofpoint-GUID: QtTxqLuwxfp7SgI0OpVPRSbAw2Nc2aQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080049


On 6/8/2026 3:09 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 02:39:22PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>>
>> New issues:
>> - [High] Unconditional devm_qcom_scm_pas_context_alloc of pas_ctx causes a memory leak during repeated iris_core_init failures.
>> - [High] Double invocation of qcom_scm_pas_shutdown in the qcom_scm_mem_protect_video_var error path.
>> - [High] PAS metadata memory is permanently leaked upon every firmware load.
>> - [Medium] iris_fw_unload() skips iris_fw_iommu_unmap() if qcom_scm_pas_shutdown() fails, leaking the IOMMU mapping.
> Hmm, please check Sashiko comments.
>

Ack

