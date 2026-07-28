Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE543BA249
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785220188; cv=none; b=ahFeWAnTRxF+gBcGaBD6kVIJu+vSZ5Pliy8GY56aj0QqvDrO/0L1p7Cxak5CIPTgq2lISRaDRQTy5VrHZFrfwGghdJ6Of6ImRdZxfFqV0YCH5rsZwDx6VtEYq/3KLv/HEtF/tnGs+IBqV9vFbCtpmAb3rtcL5Xp7WEpBsSB3wKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785220188; c=relaxed/simple;
	bh=oWTrgw2+xrfm/slKCNW9ibJEwJpUcJYQbtbrwcMPRUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+ou8rbtizmF6UKnr8MzE7hegaNOnd2urmAo+2qSDxcnynrj66nQSOUXH0nn77Ysq37YZsKcMprSH2K1xsVx5It3DgK4JqmGa9hmvHc8SulJ+Fr9GsUyamuEg+bpm6mFRRTl3Zb91P6eSjEPLCvT6Pqk/HmOf8+wUbxTwIjQ/0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lw6aNC6o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+OnVDVp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lw6aNC6o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+OnVDVp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3akUA2693093
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ElPf8a6niFpR9VyWE5K88kAbHmmM11rpy3xejveZiY=; b=Lw6aNC6oJsGJ22zP
	wH0FGSxU/BAaA0jgrP9qG+uuz6T3VP3jrW9hpgxhaqjS45Wf5T/agkULeMe63V9P
	pVz7r6I+RWTigja4ZCxY0xKuzvYtBl9Lff2hCk4i3WxI9jLUSChxQtR91qNGuNd5
	rvbmfSd91E+s/db55LGKMHwjfu6qjDglMHNdgTdQTHeFKu/7g660raFRbu2EOqH9
	j95VAi4gt+HVR6vWejRnb/cO+8xt0AxAqBQFefewHnJ162iwevXRJ9WJrcagjcF3
	eOuxWdAZ3TMxKsWoclW1MNTvEmu6mMo5SNyqMo5FXVQSnWMaEQH72xNxo/kYmeNf
	dQE+TQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5jt69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:29:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so71130605ad.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 23:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785220183; x=1785824983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ElPf8a6niFpR9VyWE5K88kAbHmmM11rpy3xejveZiY=;
        b=H+OnVDVpteVcuxTzshSkMeQ+mr6TV7mHQJjyX+M0ZgmneElY1w3nhD2xOCkidqOQwM
         CIwsqkb0clIynFB1tFVuiGzPRTiknceHcddOgzTLu9ojaJyilblRMadPrYfC6L7ximo1
         2lKnI+novotnsIpEVI5gZhxLrQntXHCRwcDmfGpdNTdDBAckRTXz7n8G78fPNmEdjmv2
         pj0cEUm9vKFSbvtlYGqHFiFqDoS82m87GTS8J5dJRW5lc54fICAr9kpZPCh4s7xy8hx+
         8GJqntYlPmC9pukwmKw4RrX+v4ZZQBw6iDh4mBb9bwhP6e0y+JMcPYku4GMHh18kaovy
         GD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785220183; x=1785824983;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ElPf8a6niFpR9VyWE5K88kAbHmmM11rpy3xejveZiY=;
        b=cVUdK5P3bL+U+HIjqid8caa7yGXQYpilg5hNJsmL6UMfYchtwpFB0QTmPBuiFVlBaB
         UX2uJvz900kH0dW62v5lPh6uTVct3toCaRhbNKsXuehO2XqYbL0N/KKorJUE5tENo3HE
         NNfT3ZT6Ay94q+STRC3J9v4VHcmUAiVE0Pre4+jCF5AFAbs12BMARkZvrTnY65TLIVFI
         r7eZ1hdvEo6yWDmlfuTym4asSUP6isl27jWgwJqvjFiPHlnAqrjK75m7fu2OgaXDJCbW
         rqhK+6hEhcK4oMyY6/B1WTIc0Lv1ygcEVXsPdVDY1wXYFCfOurq1a8sYx9+JuznkYDZX
         g3Zw==
X-Forwarded-Encrypted: i=1; AHgh+Rq80yfZ96hgJObE38SI0wrdvzputBOtWh0NKmLP5HyPZmsxPifvqnDALdToKoMHCrwJyVJ8ik1rrX5/@vger.kernel.org
X-Gm-Message-State: AOJu0YwESjTPoqnlXaMqmsjJpO3IkBxL9LMVTzNaKkzZ6oGXZ2NPEel+
	oz78mU4sWvD4QzlF+eD3Wk2GJG7vjGpvsRb8iDhA4JmIYJV6vGfeCWZv8KO1XYpMsYxbhdN/Jcn
	i1rEcrvOVvlHq2i7D2Xzri+IZASpA7gHtogCrhLogm6iNAXZkttORewjSYD/0atH6
X-Gm-Gg: AR+sD12cwTuoZk079FtjDK0z5Oq0G+h/YCGRfKaDMdfSkW7TrPBoYPPBfnsww0mlMkj
	mv/h2l6HPTgrx5eZHmD7Y3SM3xZlIM2ly8FkPvJRg97ddhXdVu95VsFFI8uJo5EpJTc+TY1NBcS
	qjUZU2KyjfQHI6DDuCOIosqpnBI/51bS6Rju+ApVvTmV1vvn1mx2VmRxDWAh7X7CgMT+Hk7IU56
	DTf4luodQi0GJZWFx7ADKztWlP2ACQd73noQe4DyDQ4USzUglgSncaErKx0IUVZQTc9jQls3K3N
	Q3S7Ic1qXFlkuLe5r104Grktiy3ZTg2odAv6PCSOtXaINlWT7qsfP34hQI57yncJcDNKyGdJqXI
	5RPKa2AgcZouS623O2Az7KzJzWtTdpfRmoh4=
X-Received: by 2002:a17:903:fb0:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2d015c91d62mr12700025ad.10.1785220183504;
        Mon, 27 Jul 2026 23:29:43 -0700 (PDT)
X-Received: by 2002:a17:903:fb0:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2d015c91d62mr12699815ad.10.1785220183074;
        Mon, 27 Jul 2026 23:29:43 -0700 (PDT)
Received: from [10.218.37.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81cd32sm45706925ad.78.2026.07.27.23.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 23:29:42 -0700 (PDT)
Message-ID: <e5516c61-44ea-4224-9da2-1694eac10fec@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:59:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Maili PCIe PHY compatibles
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260703-vdev_maili_dt_bindings-v1-0-c9df0916cd5e@oss.qualcomm.com>
 <20260703-vdev_maili_dt_bindings-v1-2-c9df0916cd5e@oss.qualcomm.com>
Content-Language: en-US
From: vivek pernamitta <vivek.pernamitta@oss.qualcomm.com>
In-Reply-To: <20260703-vdev_maili_dt_bindings-v1-2-c9df0916cd5e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1NyBTYWx0ZWRfXwNqfrSsv1/ta
 INOwlGnHeBhVTfvTVI+8YVjiUtvkpkYnf8BdQ4ee29Ue/uTNPuae3ia8Hgb9UBrB4lJJexNVRuI
 zIDeA//ecBXxyagPVIPppI8fO32iCZ4=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a684c58 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4DM8Ldo2K2qSuXsH2HoA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1NyBTYWx0ZWRfXxQA7CGV/tRp7
 hZPTFkycNzN+XxFtanuveCD4wcyV+kQuRsroE/RI4CCQ/rSP0gu89VCwAAJQd9Zo+TxZdhs+Ysy
 EP7cQh6J8bGiiiiCPXWkFz4v4ORfQoKvzRN7aSBGpvL0HS4MVd/vOab/f0Ihe88HURfWKHapEHL
 ITYKgPitaHoORs8ut5KUM9yW600kBuMtQv5bbUjbnQiDf89Mra0AqecetaoMtzaS873NfdyfVre
 Zkd4t2c4xo8opgCbHc+a0zIVmWT4X89wALwr0FOyV6i96Gt3xUa1H8MwAT8tfUq7P8+Xa+ijWjL
 Q+bzYx83DGpDBcmEf+1oR4JUypDuKbwGWoIBRgJHsE3ATPfq9EGz0tTgoscU76OLEuzjsQznsR3
 4pPmC/cFthsBx+DCaIe/v5t+uHYWEJe6dDoFr90o7YweMmgUSStVWFYKF6ic/UbsQN9FOczCcVN
 tADquclEQ/T5LShrvWg==
X-Proofpoint-ORIG-GUID: MDRUDV3iFpW4nLSlZAAMDmL4ICjhb6Bk
X-Proofpoint-GUID: MDRUDV3iFpW4nLSlZAAMDmL4ICjhb6Bk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280057

Gentle reminder

On 7/3/2026 5:38 PM, Vivek Pernamitta wrote:
> Add qcom,maili-qmp-gen3x2-pcie-phy and qcom,maili-qmp-gen4x1-pcie-phy
> compatible strings for the Maili SoC PCIe QMP PHY.
> 
> The Maili SoC is a derivative of Hawi and shares the same PCIe QMP PHY
> architecture, allowing reuse of the existing Hawi PCIe PHY DT bindings.
> 
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> ---
> Dependencies:
> - phy: qcom: qmp-pcie: Add PCIe PHY support for Hawi
>    https://lore.kernel.org/all/20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com/
> ---
>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index 259ed9678393f12c03535389b972fed0c7e36517..971474526cf97cf333a80a31e8fb13abcb995e97 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -23,6 +23,8 @@ properties:
>         - qcom,hawi-qmp-gen3x2-pcie-phy
>         - qcom,hawi-qmp-gen4x1-pcie-phy
>         - qcom,kaanapali-qmp-gen3x2-pcie-phy
> +      - qcom,maili-qmp-gen3x2-pcie-phy
> +      - qcom,maili-qmp-gen4x1-pcie-phy
>         - qcom,qcs615-qmp-gen3x1-pcie-phy
>         - qcom,qcs8300-qmp-gen4x2-pcie-phy
>         - qcom,sa8775p-qmp-gen4x2-pcie-phy
> @@ -200,6 +202,8 @@ allOf:
>                 - qcom,glymur-qmp-gen5x4-pcie-phy
>                 - qcom,hawi-qmp-gen3x2-pcie-phy
>                 - qcom,hawi-qmp-gen4x1-pcie-phy
> +              - qcom,maili-qmp-gen3x2-pcie-phy
> +              - qcom,maili-qmp-gen4x1-pcie-phy
>                 - qcom,qcs8300-qmp-gen4x2-pcie-phy
>                 - qcom,sa8775p-qmp-gen4x2-pcie-phy
>                 - qcom,sa8775p-qmp-gen4x4-pcie-phy
> @@ -230,6 +234,8 @@ allOf:
>                 - qcom,hawi-qmp-gen3x2-pcie-phy
>                 - qcom,hawi-qmp-gen4x1-pcie-phy
>                 - qcom,kaanapali-qmp-gen3x2-pcie-phy
> +              - qcom,maili-qmp-gen3x2-pcie-phy
> +              - qcom,maili-qmp-gen4x1-pcie-phy
>                 - qcom,sm8550-qmp-gen4x2-pcie-phy
>                 - qcom,sm8650-qmp-gen4x2-pcie-phy
>                 - qcom,x1e80100-qmp-gen3x2-pcie-phy
> 

