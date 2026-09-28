Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C885243CED8
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578224; cv=none; b=QLlTd5rOqKXww7M/sY+Mbhi9X5PzGLdAt2kpiWDklYsf793DVZYzShDHxl+jISFTu/ULMViIZ0+b/sacJnME9SNlZHq4La4GADoP6x1h7D0JZTkcmUqBnR9mQoPYfCeAgVXpWruyVqMl36qwwcy4q2WEoJXk34hRba6/541CWH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578224; c=relaxed/simple;
	bh=GCgrWcGSYCDY9mnbDQEO1hABrtGS7fG1AJ/ZSwmQZpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erW6CxMngZwX89vgbKbkwI9JTTOmQsmhduLSwxe3uuSe5SzzRgosEeWj56HUjXFSFeP3a8XoibsqBbU3ZCN+tnv3sORmLPgrwpoOzmUiSWDznirTtVqpWPlQCEIEMrfWQSgzgt9cPr+M2BDmQBsx+A7WuFZ3vkTlNYyJxRPq5lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LwYh32Uw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hD8ZqKld; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LwYh32Uw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hD8ZqKld"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RLIrsd3219203
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4OUbyzBVRks7k0WbMnD+M/l6sliOO4VjgKoS0xSBAbg=; b=LwYh32UwulbZf+IO
	jFpCE09jsSD2szNPg9DkANXz9m8kUMETxG9LCYtzMzFpv7lXFMdde9yaKbrwB8TJ
	7mGM3a4wiI+DpvtiWB5qINf/U8sPmxkjCx1rDH1dVdNrjesQJ3qeY77zovnS4CFU
	8cn37vAhe7RtJrXWeHGG8uZyDhGYByHmyaHEMeFm2geFxnhczHnnUj8dRWe19S7k
	XP+XmRukowi/i3NrMXGm4tULmhijwPT3ALAlZcwO0WFWknGQKXpaGR6cPfe6jCmk
	l5uPUVagub5ceP9pvs9B2iVuUe3cah7FIslcRPpFSKoUPCKTdmU890NSDPMqYkU5
	r+wmvQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav495up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:50:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-882776aa3a8so17776b3a.1
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 23:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790578221; x=1791183021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4OUbyzBVRks7k0WbMnD+M/l6sliOO4VjgKoS0xSBAbg=;
        b=hD8ZqKldyR1ArE4b8KLiKOK6WFyxnUNHVzYtECA1q6UwutDdfgW1vdEpIJ1W03CddH
         U+WDeAoG21RIwygFzX6uYxdp47jpZd7QJIDtWSIT0KlFwReoO9xMeRP3Feaodj+gQ7X/
         IE9FVBiIbNY96uqqJUPYYnrJHEwiyhqFEpfcz1XrsFVihIHwiYt1mU7UKwFNW1/XUfmo
         s8ZacX5pqOgJOqHE+dITxOlHyXI6xi6IjM8BQHCYyJzzfQRGKbEa7EJBABoUfmFFVtuz
         liDokYdl3kjvcXmjVKjOeW6Ud3/Ta9KVvHEtXH0qdgSZfZZ6XcXKahorMMUiIfl3Tcho
         wUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578221; x=1791183021;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OUbyzBVRks7k0WbMnD+M/l6sliOO4VjgKoS0xSBAbg=;
        b=CvSra/+UXcnCgti+Fcg40+yVXDNoRv93rRU5t3RR9k83rtVNId+nm20QkNks068Eji
         wRpQe0XmodK/LsFRA0bBbLj8YarCYbdQZeeS+hOTZpW04737bArPKNLPdEZ6bMCpotcl
         DPibPBhsFd/T3r0gKWUwU4r8LG6eH+byTw9ZnCzjhcEq4sMtPD/AnZfDthyWVz2oybxg
         yXyJJpdt6hKpo/bJ+696SzKcrdf8FjdYzwwlsU+YFz229aAxk3NtP8l7haFfquERvPyL
         vQb0d5yU6b4ebCmvtaaoGXTvuM2DWc3qh6Cbj8LlDqUCgsWXRbfNa75gWQmJvwiXUWVg
         zykw==
X-Forwarded-Encrypted: i=1; AKwUvBw/2WaI5cwmpBHeLT/xyeR0wolVu8dS9dJwS6wdEyjGwiCzqH+1o78RY35k1a7l/56BVel/N7ZI6o6T@vger.kernel.org
X-Gm-Message-State: AFuF++kqYPl5qhgxpr4dgPtDz/09HHDTmMQ8P5Pvduk59kk2fygnfryE
	D7dg+DDfMuIREc0IHY0o341O17/awMZjAtEEQhUZVaWNrwqY1QahH+3qHnIN/Ca5kwUP8MBMN3L
	uAKlCo94M93PM1ztW3zoBVrUb4YykcrBnbNSo7Z8OFJi8qcrEAdO21Uxyb75xFTCi
X-Gm-Gg: AYBFou1sks2eJqS9P04njNBV26PozAUQHuigwZU9WNNhP1N37DXqwPU2zwjr+qaIEvi
	4Hl7uicDV4YvlPrXrEASfchN0EkfQX+eVXL2x8NkKoTQF8paXx14Ui76e3imX8MTmSq6SersbEk
	uvrCsGPtTtiXpckYQ/sd+CGB20PSc3sOQprV9zlI5zqw3FCeWVCox2ubWvq7WPLcR6xv4IwMyTJ
	fDHLSVLSbpVZLhfMaMtPCUEd55ZI+c1fhNVhw/shpeJ+XT1z0iU8RJDLnkI6r9Kn9wkz6FdqtQb
	Ah3fJDwRppm8KijpRhSX0iMZdnt7LyE1K2SpMBOj9CCQDTV5at9rOnpOqvI5u/NlQsFkYpMS3OU
	Qj4hShL9jV0qWpa2ipM/NKhKh
X-Received: by 2002:a05:6a00:1488:b0:882:4ef4:8eb with SMTP id d2e1a72fcca58-8824ef40e06mr5035232b3a.1.1790578221252;
        Sun, 27 Sep 2026 23:50:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:1488:b0:882:4ef4:8eb with SMTP id d2e1a72fcca58-8824ef40e06mr5035201b3a.1.1790578220721;
        Sun, 27 Sep 2026 23:50:20 -0700 (PDT)
Received: from [10.239.132.150] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fe81f2290sm3633951b3a.5.2026.09.27.23.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 23:50:20 -0700 (PDT)
Message-ID: <9760cdc5-a2e5-4522-8e2f-3daba8331883@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:50:15 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm-smmu: Document GPU SMMU on Qualcomm
 Maili SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Will Deacon
 <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ACluB4kH2oNgSd3GYA0jA8mUlIBQ19iJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNyBTYWx0ZWRfX0Jss4NtBAGuc
 ArXdcOe/hLqND1dP2nCScfrgIpn5jwus9D2HIz8WSpmBsZQQYuzFGzIu4jXzlq4lYOBMTHKGy6h
 9x00oGW8P5T1uIwUsENffN7fpHCbCHLHn5/Y+CC35GSzvpTAGo26scJYqKj3f25fylLxRczJm5y
 Oq5zJ2lbNPvAvjSFUrqF6lLQ+An19642BaV5p2hzLpY2WiqKa+j/vUCyUQDiSol+P2V57RWl4CT
 3QVsyBxeLTV2ThhxQdatUr1+fbeoCqbtD9KHNSrIXGqlxdWvltuh2+3KUFVrxLP4fxMhezO+dWV
 eSR5LlsAlW2mfOGWJmQHyWb78l9dMckvtiSDOPF3wBFUmojlfqNm2XsnckYzcSnUIrXVN5jQflY
 r4YciKqNOx7pGqPieBcIXkBuwNZ1lVeU5W1bCWYp/iNtH5iPlTlkCtLmrG+k1uL+TMUT7mOnWbS
 ap2A2bq1OsNBTeateCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNyBTYWx0ZWRfX8f+VY0GM24Ty
 3VHppey3rW1CbkvFyKBSd+eU0VucTdvidBuFplGQS2zBbfCNJIuUxFZcxPgRPGxrrm4/Fozbx9j
 4tKPbikBT0iHeMDbip8Vs2GL6goFI9w=
X-Proofpoint-ORIG-GUID: ACluB4kH2oNgSd3GYA0jA8mUlIBQ19iJ
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba0e2d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oR-CnN3JeSK-wwzircoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280027

On 8/31/2026 10:44 AM, Jingyi Wang wrote:
> Document GPU SMMU which uses "hlos" vote clock on Qualcomm Maili SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index ffa33b7f4a96..187710fcc567 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -101,6 +101,7 @@ properties:
>                - qcom,glymur-smmu-500
>                - qcom,hawi-smmu-500
>                - qcom,kaanapali-smmu-500
> +              - qcom,maili-smmu-500
>                - qcom,milos-smmu-500
>                - qcom,qcm2290-smmu-500
>                - qcom,qcs615-smmu-500
> @@ -579,6 +580,7 @@ allOf:
>                  - qcom,glymur-smmu-500
>                  - qcom,hawi-smmu-500
>                  - qcom,kaanapali-smmu-500
> +                - qcom,maili-smmu-500
>                  - qcom,sm8750-smmu-500
>              - const: qcom,adreno-smmu
>              - const: qcom,smmu-500
> 
> ---
> base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
> change-id: 20260830-maili-gpu-smmu-33d20c1f4672
> 
> Best regards,

Trying to be a polite ping here to request apply since outstanding
series are waiting for apply of this patch.
Feel free to let us know if anything is needed here.
Tested with below series [1] :


[1]https://lore.kernel.org/lkml/20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com/

Reviewed-by: Maria Yu <aiqun.yu@oss.qualcomm.com>

-- 
Thx and BRs,
Aiqun(Maria) Yu
