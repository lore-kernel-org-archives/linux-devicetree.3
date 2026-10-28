Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201895;
	b=uoYOAENmCH/oCPWo5EwvgPduAicQUQzPnBG6bNm5JAiEb0YFfvbx0w0V7/mWCyaqREn/
	 XrCkPdasIhAUPRi7t6pVAzLM1LJBa2fVG8+SrdoMhntZpJj9tXduIP9cDM2EfPq1zZa6M
	 Nb6pGCqjWvpjRYdrFAqYN1x1/qWD99kJjBtZQRyIyA8bITeZTUm2AUP1YmE1dmBscoLKC
	 eu4Aiw2LEIpQqZJ3obssuC+0TybLdV5glWwHwySol+nHdLjoIyLbCP/3SaitXBc9N4YFi
	 Cwoc3w1HCe9jpv6LUnRPf8JS/utnOxHaIuvHyfvF8SaUrkc2za0Og4dpSkQi0aH3SAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+5H9oUNQEUrTL4nN+lCc37eHgcvSEzquzejy5qpdGCU=;
	b=vPvrqtD2IGveqouBSSCOPs4/FAR7pIF/qLX9OZUPOD6G2qmU6rFsW4iN571DOqIkname
	 4WUn++UGuKwrcugqeox8eqqCuxdXYYqFE2r9CV3ROtCfQ+/hSnMzGeJMzoTZHMJSVZoPH
	 to/HoJw2nGFeyZqne9OVuZRfW4P3kYeXszXXDnTNFQVwhRz861GCXPBlEbtPgar+duHc2
	 W1EmpdDo2b6xzjlmbXh/457jiv0tadAmalsbDMOCWtkmlu9RX37iAO8fhVWa4hSKD5sig
	 swNLyWZ4Nak2Z8gkBtyA3VDSxc8YcA8hFmExBQ7QKveGGfHP4rVlRB6ELRYJ3xHsabg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxG9kptS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OYsMWP8+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66C3606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E66C3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxG9kptS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OYsMWP8+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA5vO966643
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+5H9oUNQEUrTL4nN+lCc37eH
	gcvSEzquzejy5qpdGCU=; b=WxG9kptSioLFMFNbB6LH41yKmTSwywiZW4lc/rct
	YUNddip+a2cyD7X3tUt6xdq6KUNTquTWiySu9km1HEcfKYarP/KAxzYhf/v9O0VI
	T0mPokBVtnG0wdDtQW8QS4sDUPBDaHEuR1hQn9rdQNRu9N3oByQ1EpPuo1cSaGTS
	rN5pO7XWhEjxQp7Yn7X3hBn3qmEzmzNfR7zRjiMJ4UB6A6uz+gW0j4/dqTV8Ibko
	BkSrQxBp/gXX9OKw0ML3usbUYOu6zA8j75Ay7Xk3Nd8p0jj30n3mgWtHgMvcqLkY
	p04cczn21Ai82PJdv/37FkxAVG4YBtXWhFY3XoW2vo5hKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjgmsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:38:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso441847785a.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201893; x=1793806693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5H9oUNQEUrTL4nN+lCc37eHgcvSEzquzejy5qpdGCU=;
        b=OYsMWP8+LqQ+XzYIic4TrbnKKxBSeFxP9AAQZ3pDCVSibbZoHYi84nIq0yeIC5poW2
         hAbMeCwvtKOH/440XU22duBuHHo5Hnt70AQB6k8r1HkpBm0bLjgszCUMdPqCx6LM/Gd5
         wl1uKN3xKe8WGQQVuJE6ZX9OlZvy0AzySQT/Ld3YdMt/d8xBPzu60mDyDgxW9SSx99XE
         SpBi6e+slL/LSUVkhF+HklgQtRrm9ZfNZ38ex9pPYZVSVTBKTdaBaiKkjSKjaxTNVz4Y
         nFNa8uhYx+KHRUcsvzprAhl026OKYGA6QSrJJK00B1Hf0DOwi8y466jP2hXyFHkDpQ9w
         XXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201893; x=1793806693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5H9oUNQEUrTL4nN+lCc37eHgcvSEzquzejy5qpdGCU=;
        b=RBSSKuqCLnm7HyDvqD7yKpE+kmXvvZnQdrV5NiwbNkLAQOY+xXXsHFyUOj4f8GSA/G
         i2xaeBI6oDnYDXnx82FLlSjrZ6pAx0zxq+qlwG7Es7WfPErKyXhmhBV5+Qrco7TIro2R
         6FqPb6CXN72QRfMRwxNWqqBaZ7I3pBTJt0smZRyzfVEp8SztIrE+WUcgcUV2YouDmT0V
         ZWjat69/KOxR3kLrNWwl+P+XDkj43CwYvKeyzDXmSTObK1Rf07XZfineunX9JzmgXPVx
         y7EGiCSTRu/YbHXfkyDWcXVFQIN5DKcIxeAZ7OcF+83+1xPke3leJZKtL2/AaeZE3Sxf
         VTbg==
X-Forwarded-Encrypted: i=1; AKwUvBzekvICnX0Ms9gAc0X2Ez+KM4cS5ETsi+Hx/7NRj7RT+FHLiQeWGQmYZiqnX5FsHr3p2LJlXpI/UOB3@vger.kernel.org
X-Gm-Message-State: AFq9FYL8cc68ehKGfgEthkqSuaSZx8RNO+tI+GL9nKeemW90xHLHciqV
	0g693Ke4IDpxVuCCF1muVBIdSlX2FdkHfOcYg5SDWTFIbFbiejsIFSc8uEhudobOW8Ejfyno/G2
	CFKIvtO0okAWUSNMc0OM6SK+v8jMofNpDZWl0rSkjaRQSzookympaSQk5xJtXGJSE
X-Gm-Gg: AYBFou3Jl73XjfSDWDq+LnKDvJibo9/2k/TvxYNEHlonL/IxxXL2WHjvaV5sqvwcum1
	e3NW32aeyhdiU31U555dhAJAwxPlCb4zuHijoIt8bMBHThfE7L2Onc+1V4HRlQE9Vvl4wQcBuJw
	5HMyIB5T3o0IEcv/sS5fjpxKsHIuCzGOOCcfelUiAd6k/QnpUfz0VvAkpM900uodyZ+rKXeegv6
	j60IqYWBr15Id3xJYDWWT7HvE5QaqAgEvT/4I+4QuugTjtWLJmaCK8dzpGxadREuy8E6YJDNSPI
	Dzr5ntvEx5KlDB6CAGp4Aui6E9leNoZXngXni3iqxM5TmdlN4d9whbSiQqtpXKzV2Qsa0D5AyRJ
	e+rakfnqLBeRaWbpBqHMOS0ndKT4aOOXoyyVMhlFWfMld0UzN7J2nJYCfobrCQ+FXTw==
X-Received: by 2002:a05:620a:1a24:b0:93f:231:9ff with SMTP id af79cd13be357-943f4bbcae4mr982322485a.27.1793201892911;
        Wed, 28 Oct 2026 08:38:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1a24:b0:93f:231:9ff with SMTP id af79cd13be357-943f4bbcae4mr982317585a.27.1793201892312;
        Wed, 28 Oct 2026 08:38:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm23540563f8f.40.2026.10.28.08.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:38:11 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:38:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-monza-som: Add ADC thermal
 channels
Message-ID: <quoe27hatyo4mgfvlxwpbzzo5r2eowt5mavnrb7kdkbxg75ea6@ubfvs2oxmz3x>
References: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
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
In-Reply-To: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX0Qn+N9K4TGpP
 /1Ci+XSr5kIrS8Uvc8/Dh3jiX6jKA0tGDqbip0TQJhpQb0KGyAvgjFYtDEzSuWsEUy1F/NEzchF
 l2chFxj63GFg+XA5jE7yK0zI50eHdWYkyTmlZpV1UU+JxtymtP4iVsIMxGGu5nFsQoV/ST0acrW
 vtr+K4CsIILJrloXYKAfjX6VLWcr27+iBLBZ0Rmeaa7jcmyO9sp2wA4wegJeq4HiqBrfq6jBVV3
 T4FNu0eXyAFeuQEyrqQczZtY0QpBtBPC1WyN5TB7mdxXTBCIbIfCRmDQr8HOV6F3FQmK1RHUW7G
 dskz93EObrdb0uMo1jRDysJj6fyiye8mBye5MFSZcCX7xGOTZ6Vp0k59Lfr/LnBqisOMznO5+Gi
 dmDilcqwB6Na85GjrzoVoZPfX2V122adJVI3OKcEaeGQVvReNvWXsbGFf4F0rAw+X/cSI0Chi49
 kmMW7TYbezMNZAiLS8Q==
X-Proofpoint-GUID: Z-jO5V79M0tYnHdCVQi29F__1dAXNV6I
X-Proofpoint-ORIG-GUID: Z-jO5V79M0tYnHdCVQi29F__1dAXNV6I
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae216e6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=v5taVqJvphWDvZxw_xEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX8I3EalzeT6T2
 wL+wtTXD0/59ymV8LvVoR2dWxdkelUy47MQlXAKyxFhqpMyIpOaGLLW8oPg58QAJU1DUrZdMqc5
 +URC/sNd9F1b2Mk1XD+7N1bdQEif7kI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-28 15:17:18, Loic Poulain wrote:
> Add ADC5 GEN3 thermistor channels to pmm8620au_0 and pmm8650au_1 ADC
> nodes for thermal monitoring on the Monaco Monza SoM:
> 
> - pmm8620au_0: XO, UFS/eMMC, and SoC thermistors (AMUX1, AMUX5, AMUX6)
> - pmm8650au_1: SDRAM thermistor (AMUX6)
> 
> All channels use 100K pull-up.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
