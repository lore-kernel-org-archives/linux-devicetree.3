Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298851;
	b=dKS2ISgn+d/N+qB/yFzcvPhNfJD3EBlTiCDND3gP8x2WFTAPFFD3bU25LxcZv7WGz638
	 NE4ksCxEZxMRVBYVWGU5F5w+QYkrdnuNOr0bxInNoHsbUtQxRNQMfCQU1GbUggx3m1TwO
	 QMaaQ0dGO5hRsTV57NxPguZs0W7zAoHZLjDGECUzzDnxHmhO19hPxm4V986xbBYXLXR+L
	 lu4qqJDimW9BFkAF+qsqd3hRAiJLnEkSmJ0ILNpjhpVurpl8ZJQ77ReshBe7u6M1uODcR
	 916vCVN5hSeDSDjQoYAAzhIOLeUW3TNOPHIvyqzEJdxcStDyS2lLReAVNBcyPm2Gm+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298851;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TnxDT67HWa+60SLBjfh2ADVB0tvFWAVx0poSY9Ujd7s=;
	b=Ezdr9KlwgM32tJwwaQUCgzi5svoEMNof1cN0nUN2WPbWBRnuKgzj1T9unnT8VpDZIsDI
	 Svu5pese24JnYTKvuvsAYVwZTiS/Eo6HruSIk0C/oFITh70EDlqd5YTz6bGvCx1YDQrRQ
	 KXgSZZyDHTFv3jc+aSMQ0moRNFn9JuTTVAdh/YgvABE6jpDzU7jXIsxqYhI/jKXeIGLsK
	 Thrf+yewmgvWh39isHXq7fMRgskyAGTVLdgoztfKvfCGiFN/j5Yysg6GV9MRRljqwZqyQ
	 p64qxEETOGSRq0AOSFs/jH+UklggUBnw0tRz1EBwUz/sz+6MmqvvuF8O8U463ikaE5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nqg8Z6Ih;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G8u1spLp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7F3606A321
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E7F3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nqg8Z6Ih;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G8u1spLp
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69THDhaI182135
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TnxDT67HWa+60SLBjfh2ADVB0tvFWAVx0poSY9Ujd7s=; b=Nqg8Z6Ihagzw7ANe
	h1hJK8haxcQLYIloiO75FemzIjJ6LlpqCBPmRYA44X/VI4LQJyiXTe8vk8zc0vek
	gUuntMQlapsbgUmjP9WWYIbh8wBSzSlmkMJ1e79GgGvk43XvKGImicb56EPxvZO5
	IfMYRQIlFOU8CsK3P3RVnN1aSwR3U5kPTdcRKP1J7j73sfUJ0OFEEdqKBZG9XQO2
	2ADDufJn+drr/YLahPjKcNdzuiKOWdrN49j/K4nxvIQOnDhb4nMIdSwjCgwqyOZt
	zK0uS6qNHErGJ8/ne6LGZLxYIp/M7wPdipglPqw+4r1uZ/WoS6YirVxxh7FW19wI
	ItFgHQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmac0rf4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:34:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so9411691eec.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298850; x=1793903650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TnxDT67HWa+60SLBjfh2ADVB0tvFWAVx0poSY9Ujd7s=;
        b=G8u1spLp5ysm4VoY+iYx+E0X0NB6VmTHxopt3fwiURXF84Olbp1lJObbLfItB5LuPB
         FGHgKfvKrusgwBAlSl6FC6TDWwP8hGXzTCYGOKhJvbSS2mTOQF/4eAs2jgigMFjDENiM
         Hk13QKbpbLd/IZI2bygFHC4hmnHkYtKKTuUfVMZHYQCwHz92wAJn1Tp37cjc6yIzX8DH
         tn4FLQO4mh0TrQHOPFYhzRlPF6sTsptWLNuQICwMliOIlxBA5Qwcyo7u01ahGF3fhhAp
         JKjHtRcRhz8uMYNnW4V383AkAe/L5lzObUP7kTlydaB1NzxacMC08UdC/ONbHDO5J9Fb
         aYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298850; x=1793903650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnxDT67HWa+60SLBjfh2ADVB0tvFWAVx0poSY9Ujd7s=;
        b=brAEhyug+zBFZjFuVXKPuJRH0J1QC5XYFsg/UvAp6M1mmI4TwaBVkRqqw+4Qog2I1a
         hWmI6f/P8GkFysxT+P17whwW4oE91PEz8Vq3lPLzACjedPiHDyDl9R7apNsvvY7kBv1H
         T6UMB+cMfURolrBlZxstvLoFBUeyCjpostc+t+gdN+15Aeu88CUOpKQ+7y4fmW65Pubc
         GGObw9D+XqHJ8+fT9XBqYva4cKAUpnPKFAf3r+ELrpsnYzzJ6EFlrd2MnGK+TtPJexEe
         h2UvTwB/lBvz09D7VxWNebQzJgAXlN6VdQpMcRQf0Oc4IWf+Jqm64bw7HCGgDUGzdrwX
         N3Lg==
X-Forwarded-Encrypted: i=1; AKwUvBxJR3DDydX7xoQkyQvdCRSlHs9y0Zd3ZfCBB3KllYQJf9tFIU2qJtiOew2rdhB7UvQDORoYNy41FFuX@vger.kernel.org
X-Gm-Message-State: AFq9FYI+HtPnid7MWzhqWzIMvRLxC1HOdIfLfVjES8d4kTq9PtCwGsHJ
	vP42UgVHa/lnduxpoBmXOROX1JVD0fac03o9zpa3e33ZaIkQfodQLpV427zLn09sSNg8pLKHN0T
	aOLPabLbjfMncN9lZKBMkcypJp/iKOgLYRJMy5piavZMoqmi+eQr0Np/Da9xhE+NQ
X-Gm-Gg: AYBFou3sFrPBKK5fyfkKnGF5YO09lC/sHWaRIBbCcd2WvMMvhuZFfE1Ne9SCpUhb6wD
	4Lt7xCzhTop+q+DGgzzAj0eQux/n1S7GXbti+v2HYptnaFMaOtQHTisQjc1cjYmUOkRECsh8iVB
	PrtU9ts+rDe46/BQk/DEGRPCm2piZg6qBIlkor6HrZX4o+YV7jG3WGUCkg+SgwGhEwIAg1aE5Ir
	fRHonuCHhom6D4LSVOqzrlrZHyH3jm3xwCvtYH5VODfSTfGiWK+k0/BwladQACM9jny52RtFb5Q
	TiiP7KOUUjZwG5oKeP/Z+L/HFS8+fQ6TK8CYsWT53IcYyeAPhHfmnjyWuFnBwv0OpX8GoSeyP/y
	p3jBRRv915nHwczq6u/WOTicoGTCrMS4/aSquMT/62/y7BBhrjt/nwaGikbqMYw8HxM/7Nypo74
	l7NcDGLgKfK72QWKsfXuVWYmHL8vMLb7n3GaWm04ve5g==
X-Received: by 2002:a05:7300:4353:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-36a42434630mr355948eec.39.1793298849569;
        Thu, 29 Oct 2026 11:34:09 -0700 (PDT)
X-Received: by 2002:a05:7300:4353:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-36a42434630mr355901eec.39.1793298848927;
        Thu, 29 Oct 2026 11:34:08 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:34:08 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:41 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: qdu1000: Mark USB controller as DMA
 coherent
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-usb-dma-coherent-v1-4-3147b8f7aa64@oss.qualcomm.com>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=676;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=Ot/jhWbkfz9JIUnzdEZeTq9RWVEtwTHZa8yLAe2UUkI=;
 b=3XQ5wSuwVnrZ/rUs9X+O57AKxO889Ku/apnruYrrtbOeYgswuDo2FRjUcX5yGE5RNe5Z4unL7
 VpqUNfwuiwTBTPG79DDjoEQvGjTQqQBLacWLZA6MVyz9QFynOhv28rF
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: 3E9OiKh2fmERORXL1cLYyVVXztN82_gO
X-Proofpoint-GUID: 3E9OiKh2fmERORXL1cLYyVVXztN82_gO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX6yaDrxFhPeBe
 6Q6Jyvgi+9YLzTnEyjDv2MlIQ2jP/I9YFilq7EmzyPgNxji8Fbsd5zd1mIzUcpNZq+D9SAQUMWR
 q28Xlr2pqoCQT8AsDsiHF8CgWug21sE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX4BvGpPtdXLxU
 dLdKcQ4ibz/NBlNJ2Y0OQM1mRHpyqp/BbrwAQN4kH23/AcrBdM2jzew6cUWa+VVEJXsFSs9cIlB
 IAzsxltjuYTX2MsdZB798yJCzs+kGV2vJEn2cwojTQMf/W3Us2BH276TvPz03HdVlJv6ipOqY7Z
 FOryZl/CZIqN5XMoayyRgfqRD7wmUXjr2EvZhDsMXFZWDpKoHXOa263cjXS13AW35/3C/nmenqD
 A/v2PR/A1iWKLxacZeq5w42qjYEUXucIOmwmwAJ1lG1XdNreMeYlOqwjq/uatOO/zSiZ+MRZG3h
 yYS758KBP/wv4EVIiMMJbUQXpd6Lf9vZaOHK5aoPq63nCmh27qQsg+5IrAsWwDcJcFFq8C9fH1s
 IDZPXbi9nLL/v67+Xza0cQzOWUjtafAoLP3EFXPIUVyMMsBWDH3OOHNGgGKJ+YyIU/e6FLXGI4t
 g7LhWy0vhz7pUcrhfdQ==
X-Authority-Analysis: v=2.4 cv=I6/w19gg c=1 sm=1 tr=0 ts=6ae391a2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YCH3veeWGSw_5qN_8KAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

The USB controller on QDU1000 is DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 3a25b5100836..30a18360ef2a 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1031,6 +1031,7 @@ usb_1_dwc3: usb@a600000 {
 				       <&usb_1_qmpphy>;
 				phy-names = "usb2-phy",
 					    "usb3-phy";
+				dma-coherent;
 
 				ports {
 					#address-cells = <1>;

-- 
2.34.1

