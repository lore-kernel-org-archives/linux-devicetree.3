Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346C13AE190
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911303; cv=none; b=X/b9qhPg6IsKZljqVrOJROQhWh6PH8mo48nNN928dLK5+3dSZZyBatO6Pjc4n/ovV0lPpgqKLw3v3hAYYlDTY2yY+o3leXYqfSXNmXnasAknmNdAd/hEt+usxqE02hb4HbZfxP+6XcLCcJq5inxJzYZ3fKBT2J0ztHBdjEJhXY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911303; c=relaxed/simple;
	bh=xcS8+PTdPjia2DBa+T7ce3/XFD4I1lgSgkQoFiLYDnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oV12vz3Y+4+B7ITHBFDX+GWSkBjMUqDRgNl0Y1hWmIWWRMF3Dc54bmAeX8+Oa6JTVccDPvzZN5Th2260VtMzvCNpU6iIVNj3c11GB1SEQBiwZm6nthOrbXyY2IgsFepBlVCqDx3KkBYaKk389uF9B4OpO56b/dNCEcp+qbbllak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jm+rzYcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9GPruAx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jm+rzYcW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9GPruAx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65890uSJ3164246
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 09:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	noils2TMNs914sTPuUGf6yPxz2nxtQ6POyQJ6i0X/mU=; b=Jm+rzYcWw424UMaf
	a6G4DrKNHyqLC4QeZ+4mXROqjrbFBVZtS4hqLHDHXjUaGZApYU65UUvBnUKOm/tn
	Y+SS9tLch7/LWzt+BLS4+V2eSJs/u1vX5uJPanOb1LFxNiPERp3833DylOPUpWyV
	SoGB/HgM5EjTK6KoK+3tssRvbNYvO7pVtfZmjPiqKv01DCtDgafQLdCtTOXXBvjT
	fl/YHJBDE9mh/pFM2KxCagQnACXM3+N1x4q7PULVm9VI/aWQP0f7GjQ9Tr7zzoSr
	WKBHpndHgqNF+HW5T9HRU2KQJ4PkI4QcGrzJKcCAhw0D2JbJr53YRQYujVW+QCEV
	ZOIjcQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0g50t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 09:35:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccd69b9a10so4572816d6.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780911300; x=1781516100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=noils2TMNs914sTPuUGf6yPxz2nxtQ6POyQJ6i0X/mU=;
        b=X9GPruAxihhoxXGGQEGaGG+lSkUWUMcJs79EMowaWL1uW8nsl3Sj4709WdHaaMozLi
         EOAXFO8UaZrpmbw2g41H3JFDvOdD3CsvV5K/qG+WV4s53OIYTf8Z+Nk3kNaus9eud+k1
         faiOCr+/povcAzVTK6a727wD0rX7H1IAdRy6yYlKQVhw541J1Z1Hse582eKgiKAukKtt
         yG4xhcekpPEEf8QWmq5oMVqd67v73yXKbEZKAYmG0rPLbBXS4b6OG+y5l/UO7eGbB4pz
         kbtDWe3vZPhDSKk08q9p/IXqsiI2riaQHy6h6AFsYt6r5paQOm87fe6xCtS1lGVJnAy4
         F72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911300; x=1781516100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=noils2TMNs914sTPuUGf6yPxz2nxtQ6POyQJ6i0X/mU=;
        b=jFBsGiaCs+GH9OUgjrrhmVJksrx/OCto/WgQvUYehBDnh9DCtYfrtMleJ3/FFb7xCN
         tt5W91l+wL3ri9a5I8u4MD1wW+aEaduHD6VBvPDHiQxAvmwSYbyoZcVA8vvGLaQMgckg
         VsJh0A2hQu0CsuDLYZ4fLhSbxfxt67rIgScKKMMAKaD4d3Mge3mkaKrKEUk19HhqyVCX
         17bAz3KoKNRJzEstKDlKKouTUSkm+ykBtAu8CdsxmUHHtOEpJWzN4XDYNpkrb9pgeUP1
         sQ1PACkps/fFTYYKl4y1QOGed9gLaiKSSgw4x/sjwtpalIdiXb6CJNDJzlONJpOH/mnn
         PUww==
X-Forwarded-Encrypted: i=1; AFNElJ+eknR7oQ3WwdZAFmW6YWZm0JX3GJrfBHS2GL+Np3rUszQqEP7NF375HffaUH7lSbc/4erjaaBVO/yu@vger.kernel.org
X-Gm-Message-State: AOJu0YzeidFSjca7Vu+eOSn8mMBxElxMhNuMec0cvEjh7x588y1jDvX+
	s9Ll3WwwfWupioHSwWO8dEviwcVC3Hw7IVGFDZgmhF7bx5sEJoH9VIuX/XsFeQWKUuQ+g8PfNQd
	7sf1uGmd3lTWxPck2G+F4xL9Q2d5wc8pC1ONbVLuRPE8hLFxIzJA8uhLcxPnY4ov6hFKprNzj
X-Gm-Gg: Acq92OHHDkQkEC09nadYunqgHZjKJSA+7sQmbkokOzcSxqmwmHHrIEy0Qwq1xgo/JiN
	k+v86vx/cOfwLS/SUZttmfc19Cku7iyt/wEbK7f2bcnWQAhOHJNwtH/2yJAk+TBmXC/ToDKDZML
	Tn7GV/YswwF6KQHiUzQQFD75aXTcatwiE+Op2TtG4PXUZTPBwizB7zXlzccmtewEm3jdSt1+LOv
	tFMOehinrb/AxqqV+jRgfqFyRm1cjvuoNJH/+b+voxLAQNfGMqvnnEMPU8tB0w4y27v+HX34ZEf
	hzvt7YL//FSruHq4pJhzUD5mD8C+r9nbgL/xzwgbMyAnSEpPYrmEj9CU6blMVD8uPf3GedjzMn5
	pxBupM++iK6/fbOmV9v2W6p0CkpKOl7wIUU80oUZgwQ/pA3ok2A0fFJWp
X-Received: by 2002:a05:620a:6486:b0:8f3:5988:f97c with SMTP id af79cd13be357-915a9d85addmr1243694885a.3.1780911300316;
        Mon, 08 Jun 2026 02:35:00 -0700 (PDT)
X-Received: by 2002:a05:620a:6486:b0:8f3:5988:f97c with SMTP id af79cd13be357-915a9d85addmr1243691085a.3.1780911299749;
        Mon, 08 Jun 2026 02:34:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm838592466b.52.2026.06.08.02.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:34:58 -0700 (PDT)
Message-ID: <a5783c4b-abf6-421c-84cc-b7b565d37fdc@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:34:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8350: modernize PCIe entries
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
 <20260601-sm8350-wifi-v1-6-242917d88031@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-6-242917d88031@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4OSBTYWx0ZWRfX/QhYzWkGWgX1
 CRnDNht1RzwHiOElFuCG0ueEQ/nBbxCUyUyg7Ai+S4QfUiuiypecphTj7t3Oc+HXNGWJo08DXHe
 jrO/Oar8Xv2AIraIUE871DTr5jQaxaKxnzsoUDI5rA8fuOMLr96M09FlH5zK4b7PSVCbqiEZo9W
 hGtB1IGRvwBukEgZn3SKITSoYk+PODrcASnyoxSY0fRjk+SeO5xKTQO3kkfJ2JGXk1ldzo1Dp2N
 Dd/bk590AKYR+OFUBdZ8pyu44CCLuoKeGPH9jobuDMkiB33gGA6ntQkdvw6QGZG7tGUsfmkl8l/
 uhEHxo289UQCcyzTF82GY0Uru7zMCbRi7vSNKiVQreEOeMWtig7EpeUS59uvvlsXK7rqCyrxlr4
 6HdaKBCBKEq+9Q1an59cVzwaX+rsq7fSwy3bjsVKcvuJlFAw7zgrB5wyYCz8GNaJCV3Heieedbj
 xdQecv76CQD8pmvloJA==
X-Proofpoint-ORIG-GUID: 8dnozk08DwP3gM8VDY2dCBoxe-rSD8WV
X-Proofpoint-GUID: 8dnozk08DwP3gM8VDY2dCBoxe-rSD8WV
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a268cc5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bMn7uSZEEfIJnIPTgxAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080089

On 6/1/26 11:46 AM, Dmitry Baryshkov wrote:
> The recent suggestion is to have PERST# / WAKE pins and PHYs in the PCIe
> port rather than RC device. The kernel recently started warning about
> the older style of DT. Modernize DT for SM8350 platform by moving the
> entries under the root port device node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index eb2a795d8edb..136daa444865 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1583,12 +1583,9 @@ pcie0: pcie@1c00000 {
>  
>  			power-domains = <&gcc PCIE_0_GDSC>;
>  
> -			phys = <&pcie0_phy>;
> -			phy-names = "pciephy";
> -
>  			status = "disabled";
>  
> -			pcie@0 {
> +			pcie0_port0: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> @@ -1596,6 +1593,7 @@ pcie@0 {
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges;
> +				phys = <&pcie0_phy>;

Other socs put this between bus-range and cells

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
