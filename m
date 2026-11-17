Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932357;
	b=v29FpJTUw5iiUt4gbKYDiyFTreH9HYQ+zbmQIETrDKDc2NMjrteMDdMrwo6mN862SXh9
	 oIlVTUNuB6pwnj0BIH2+5iOf7m4BCpMSpdBOcIeuJPU7KqI8Veuu/Auzns1pMNaJqFAaq
	 CqsEBL949gYWNzXP6L7CATBos5EW1jBD+xxqgM1U9QRfMi+iIvMXu6JCaS3xKk0vL8A0O
	 Jv9ybLXtJ0n4GnRYMowEzMCIr7sV4Cuq/lqLK0HKdLJIx0S9f/MyAgL9nz8lRfj8dOvVK
	 EEsoeVpDFVM9rG5flCv8WQSDGNfp+olzqtZGBHfkQ3N8K9N1028cwGkz0KvfGYrcypw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PoydfNflc37spVuYW+Qn3aq9PQN/sV/Z8s/hao3VHYk=;
	b=TzCETn7fwIbh6QyCZaBzTf28ETQpmHfe8cy9ZfssW91wyLZfAwLFy9/4TjLYTUYYqcKJ
	 K5omvz/pwtYpIqATe69j/aN9MP2lAD9eG0bPT6MJWuPY5shKWJHNrdE8dBj7+RxPzz9Io
	 zLUm1IjhDYQ9AkLxB8wCRmDMdHMJa+Ru5yJy99/XLhdbVqRJcqtvzYJlOsPA5ETmkE+nN
	 kQZglvMqZHGiEUlbzzN4qm9EDYj8pS5xwA5+oij0+Xw5aqOcKjNjfQuVAFBSabVXMNmYA
	 i38AzmoYUz4D6eALDctc0ob0wqguHp00zAoyyP/chs8WV1+V9931reIviGEE6pt0A9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XYWAiliC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AN7Kxuo+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D90606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37D90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XYWAiliC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AN7Kxuo+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFR23w3503886
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PoydfNflc37spVuYW+Qn3aq9
	PQN/sV/Z8s/hao3VHYk=; b=XYWAiliCsqFDfQmgDEgLMBFs5w3ewAqotIg/w28g
	CvkVNqkn3B2gfqbOfqQ8WFSTaC5hLc9DM3pbbKf4U4uhrd2TqkOriWTEY+SKmFc1
	FRWpVg9r1FA9PMPExtBvOCboddjvjP1jPvTnFUMCYrWZ24E7PZxawrTxBwaAWNpA
	iDSTI1qAswQSUNuM2+buMCWPotRapEJLJYzy38Bf+qZkdzAoJ+IzmKRxWy5wiQPy
	apcy9XzZB070kVX1ll5hzTacFY8nI96kpuBohOgDxmURkDhcsdx4FiQkW9ynoXvZ
	CPOAu5UNNonEitoFwsP9cT6hCU9997EVBQtLFSIMFsLehA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv11j5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:19:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3821eb27024so33117eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794932354; x=1795537154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PoydfNflc37spVuYW+Qn3aq9PQN/sV/Z8s/hao3VHYk=;
        b=AN7Kxuo+tSZpS6y64y5dQOkZqTvZ4B0YxzyJbVXWN8I+FLW1D1sh6YtgLfmtK0zvNs
         cEd6+dxeDAEQDK419tqJLiQrhdCpay/MQ4bgynUHO+9Pi1xEozCG2SODyBfsakicFwQn
         cuiRLIllhnBsSNdzBJXJxMlS5TvixtD+H5HVBXjURQx7GCNcMAbyAljfe6pqGc1S5BHf
         xvDrNiG2zT+V/GL3+S8YPC/OddXKfYQ6ApM4MYZLdn7fqSv8a6lLWWwlAfHm76g4oNKm
         TtRx1Jp2lc6cXMjM++kmV02H0BXdBOlk8Hxx5RZfT0IN8Y+gWklKCPZ2O78OrZVUsSqC
         d/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932354; x=1795537154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoydfNflc37spVuYW+Qn3aq9PQN/sV/Z8s/hao3VHYk=;
        b=UAfWqIIDpa4/C2WWpi1VCjVVGY/pCUhp9jCDR5I3hLu/gCjd97WXgt+Zimhq4BrIv/
         DvLC84R5ICilJfjEDHGvEBZ1wNcqP3K/35VLX/5mpfhbyYpETCPDm963deLuP6j3PI1h
         2Ti19Aj5y7l7Pn6sjSh1owr5F223bc2iJlUDCGSrQNIZ5gjQVwdvPWw1clbXGuKRDGNA
         36WN4pVGeYzJIF1oOQNjolGSTxofetf0TkRYPyQWeJl0Lgtgkbo1qfoc0Q0wb+BuePZ5
         UYPQ8H+UYCCzT1pAa93UvueQDEZolzBCOAdNEuVKZokG07EYWP83v0uRjG81flePZaZH
         z3ew==
X-Forwarded-Encrypted: i=1; AL+hErF8cwCztxZtCeKhbT7hHhOxg1TwqPFPw11tXlDIr8ks/d4GdiFhFLlz9j3QspKRa57nvOM+AWKKiicj@vger.kernel.org
X-Gm-Message-State: APuU4Z+nQbgfVH4sjFW6WSMDwGhWM3rwKYAbRtxVtPi4CkqHt0AZb6AZ
	e/Ub+5lEdzxYUEeU3CB8OOnVb5tjwgNBNFLeTiXnk3YFFXCX07TIG5UXhRqBH0Dy4aWBZj81ZkR
	DHSH2OgtQPNBkbCgqSvrrKb/7klGqtgqBn2VeKXkSjYbF18dt5RkeaXZxqOFlxuU9
X-Gm-Gg: AZFdTZf+A6E9lkHXoncec8+7hl/ADiyuhCoKZElEHfNwk2L3ePRCESBrJedsQeKlVEm
	Uqrrt56pRROh//oJewQidChViaBqDI5/2Qg6weO0/IbcoC+sBy8lVVxfLgksMIYcfouUEKefHXp
	qkCwKt6LtKr2bnN/type3aeOvQvWCfDIPeVbRXGerWJcgab12/0aaZtZm8Ou+p0Tl9Rko+ORUWc
	EqvU1N/in7+3M7Gr/IeDh9a8pHvwmcolJRy/keCF8zngN1JdDDRSAZDX7OynzGILvyJpkJXtjh7
	ihLNCbvWcQy3o3BT2PHDllsH1v8sf56bBk8FCfo4J1iGvUDOR9ZzR3FWCHgQUgFSq0U+Vq0Giaw
	/wQB+0SSaohvbDr5FtTqSm3ZAwmSjvKtNAvuqdJmmhmLgvXmJXAOaQgguvifz0rPHGCN8RKzpDM
	E=
X-Received: by 2002:a05:693c:894e:20b0:379:c9e5:cf0e with SMTP id 5a478bee46e88-379c9e5daddmr12866903eec.38.1794932354363;
        Tue, 17 Nov 2026 08:19:14 -0800 (PST)
X-Received: by 2002:a05:693c:894e:20b0:379:c9e5:cf0e with SMTP id 5a478bee46e88-379c9e5daddmr12866871eec.38.1794932353720;
        Tue, 17 Nov 2026 08:19:13 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm68613294eec.8.2026.11.17.08.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:19:13 -0800 (PST)
Date: Tue, 17 Nov 2026 21:49:04 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
References: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
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
In-Reply-To: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
X-Proofpoint-GUID: VjaT65wl9pyY98_03figgtpFULCu8cxx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2NCBTYWx0ZWRfX6dsnukS+7JSi
 5t91vxq78YCIHmNzVemrKX5pIM6GDuOupJQQDpl+FcjlRdy1SuLU2HzrgRPjL9+3KnKLaUuG3Fw
 RMtBSB5tVT3TnhRp/VNOVOLc8cUTCrA=
X-Proofpoint-ORIG-GUID: VjaT65wl9pyY98_03figgtpFULCu8cxx
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc7e83 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=I6c21bvp6He-TJasAPkA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2NCBTYWx0ZWRfX0Rb/P1x2lXVx
 sVq1PcR7ohwpyfA94d75zH4GO45a2OUnYQa8/ytxb+86rgCJPx+AqDe8rnO6bc/azgMKBWEqTyE
 kOc4b1sRJIZuhXiN6Vzv/woQ5Uyip1Utw8miAfi7hQuIn+KGeZ9DayU9qbf3iN+71C1F59yQses
 nwj/lDXDBeR6URCDXl2R8KeH2vzKbDFhDXlprkuaosLUnbKJgyzEwljWj1ZtEme02AyqTSahYYG
 7cav2/gw5zGRyX3Gj6lw7DY39DXtfiHqEcPsS1baGDITstW4vqRgZIQ4vP4jmyMa3mizRY9Omxu
 8B9MgXW2fvND19dRwQ7OdQe5E0JusV85BQT0DhzFzzLe4pKapqQH3beqPhivzGLpxbgJJOaveX7
 Lb8GFn9gIE7fZLfcjviFTAZLwerbhp4rV7dfMEZSfeh+z4D35D47qyf1Rfuzmllzw5KB3fbYEOJ
 yueqQc8TRdSDE8lErAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170064

On Tue, Nov 17, 2026 at 01:35:50PM +0530, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts and results in XPU
> violations.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Why only for Shikra ? 

> ---
> A similar issue was fixed for the Tegra SYSRAM in commit 61192a9d8a63
> ("arm64: tegra: Mark BPMP channels as no-memory-wc"):
> https://lore.kernel.org/all/20220622132300.1746201-2-cyndis@kapsi.fi/
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 2623e139196f6398c57b616879a37f84b83d59ac..597aaf490519e605d50e24c090bbfb1e47b1f28c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -1347,6 +1347,8 @@ rpm_msg_ram: sram@45f0000 {
>  			compatible = "qcom,rpm-msg-ram", "mmio-sram";
>  			reg = <0x0 0x045f0000 0x0 0x7000>;
>  
> +			no-memory-wc;
> +
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges = <0x0 0x0 0x045f0000 0x7000>;
> 
> ---
> base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
> change-id: 20261117-rpm-memory-non-wc-c93a6ff3e432
> 
> Best regards,
> -- 
> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 

-- 
-Mukesh Ojha
