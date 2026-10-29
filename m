Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264236;
	b=2pWKtN9vsUe8/wdCXR8Y5kDhy/mIJAyTrU8rZI8S5ddpxZK82luChrLI1mtKjWAjvYFw
	 p4vQxcbf1kZipZ6hQti+Y0F1q4AXvozwOUfQMJjjxYB/Aacvxnt2bv7eoUAgnERQDbIP5
	 nChEHehDNZ6BBhbJQ9U2Eop1xycg3vbdtsjWhHZovfUdEjqgNVVaB7FffeIl/y7Ryofd/
	 /TEKl0qDNKz9IjS7hMCPMCN01s+Gq4xSy2taUmRXUTAITXbfUUg6VA1fisRoFVLVHjvYC
	 pD90w10ber1ulXnP5FmJwzKD2aKz+A9ISiylSGt7tH5vBTayz8S7V96cQJb4Dq03NWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D4dVdmSFeRE0JHF6scWJ75ZgmMOz+dO8pL/chYBEZxM=;
	b=HgxFH8EbOpdOl0H2PGN/Ka49kbmaFNynjoBkpAlUQIs5KJVdm8KoRYRq2l4e0Ysd3LNP
	 5n0dX+km6tHE5fEnJTLIEWfBOMRCpmkN/LgISokRRp4wzyauCuub3xCGRzRXZBRjArTsH
	 afEVVn2KU+WvvVG3ACVJ4Z1SQaYwdQf8hkzdygIMCizCrTKFd8tSXh10nmvWM7+C1+xNk
	 ZV4S83KNU0wOrVDXVOBWMXwRpV5WyEjhyRbWYT/WBVg3lkkKCqo6h/qxs3AGrFG6rkcYT
	 d0iUtMi1iyFxfJTzzPwoWUsmkIlnbCMCtcY0cB+WDtqVKstNU5PfhDSKdz5ZmIJvF0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xb8nWuEx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H2a/IXw8";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4528606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4528606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xb8nWuEx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H2a/IXw8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vErk3765947
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D4dVdmSFeRE0JHF6scWJ75Zg
	mMOz+dO8pL/chYBEZxM=; b=Xb8nWuExxWSsNj80Iw+7Nh/Boe4LnjrQEuyP3n1I
	ACXVL1hHFjtBaWzhpRF6mdpk8jZN00otuJSZhzYqTzym7bnm/FtJExLruETBp+ZH
	82YhFZaO5355ftSGa7ENqbvZhlRP2C5abtjiGadzH8ofz0TzGzB2qhr4uEuKopoy
	CAPVvZ8L/o0EMa31lWheJd6gtoupEwabFFMnCGxO2hJF/btFpbxkHK3sZtFIcQnm
	JJxYvtaDTrkd/AdJ5Yia6cJKuYxnfjKjHEBEOXWTLcHaAJFrXlc5UHFsuKd6yX5B
	Zb2whAvbiTxt4Jigx5tkIMfFiI/82NzdnkDl577Z60yI5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpts52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:57:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so165426985a.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264230; x=1793869030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4dVdmSFeRE0JHF6scWJ75ZgmMOz+dO8pL/chYBEZxM=;
        b=H2a/IXw8jtsUIgqoZC1MrJqTqTUsZB1FMUV0dDOex3EXft7ctiBgg58QSg0wi32AlG
         TMvZRk0c7PkMAsoAfR0/DVu//B+YLyqrY1vSi6LlRYM46Rz7xeOjzXWW0hZ/NrYJ5Mlu
         jbC//lLHwUyKL0v49Y03hlTn9i4/0ZQJH9BkeyImYsywOsQOCkXBGOU6cT0BiILX8/6d
         OtEka9ZS68lEUp8XJeCnsLDkcyr4S2d4iNf3deqAFSjK2cudSr10vN+b0hjnspFQAzZt
         tHgRqQH14DsCYqyoRKO/OgNGjdpN5kXHKZhTPR+q6XNM/5FHw2BiYVjmZQhbcOAC05oy
         quhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264230; x=1793869030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4dVdmSFeRE0JHF6scWJ75ZgmMOz+dO8pL/chYBEZxM=;
        b=OQNWnSGsx3i7gRwnOYEzuZc163aD6bSEQCQYQIg0+y2YdqUCF6ap1kdjxOg7ajuCiv
         ph2KdcifNAmyApRz3M2jumjddJW7wO4XUuKURmPHx35hwIXhKzlWTyGlIYFf/YYLZ/Y3
         9JGrtijQQiHiA8B/CddTCHACrAjS4KwUtCgkUOMKR3UuO3S6wVUQ59CY92GIf4bvp7IF
         pRI518+Ec/SnUAZdCems9FtVHhjr8AvKJxzJeigGPtMqhW0wt/SGnYxpFG59qq0TXFV0
         BiwuXEMM1NLahu46GPJnZkmu0T+EASztM95B0RBcT3P9Quz7ZzTIAfP71fM555DLi9KN
         oW/g==
X-Forwarded-Encrypted: i=1; AKwUvBxxILAuObCB2v0Nz1F4td1cgyKphfdM5dzA46cIHC+WH+EmzWId7KV4iCGMsj9pkL3Csm/C76JjGqRB@vger.kernel.org
X-Gm-Message-State: AFq9FYLOmupx9ZxS+TD0eceYKiDQtyE3rPSqYhdvptIn3D07oiDhLfXB
	B3zlY99s1bVqT26iDxs+zXtxReHYnmsP0r5g3I67pOLu7sL5UdnGdN8jjcGDYE80v8ZXphOZdyJ
	16eofzf4z0qt+Tiqx00V9eITMIRWkJwoR1gHK4bK09vjaRRMbf35VRqU5scc2Ozj5yO3fNFDf
X-Gm-Gg: AYBFou1fq1qt1Ar576B6VtzHKfq1OMEoFHa/Jp/vU5ga4R09y3HDvSCqdiGJ4hMKAjE
	+eR4Rr3JS2ekloq6j/RJqYmGDCFkPYMgWH+yg/KQ6Hg+PzI/65Z9Xdtw1fwtfTiJKqbRhP4sxfq
	XOBIBPtxF6fQjMG+ZzQ5SmCw3NvsgMkTYhtpfJotf5Z0zO7w3QCT2yA7cTvFSUr+U3GXKr0wjf0
	JkDLbe8746rhrVAb2h7LpCkJOjpHAbhrwwhgYrJKwjRqR4yejQuKJrux+aVOvzqycl40G0vSjzV
	D6gsOSS2jdrH0FygOEz4MfWL2HENs+nv7od4YGYO8LN4TvJWdaJs5cYTsZtjdIjgGm0Nr/tAOKh
	gW9u5J6ZlfLsEJBUbiPxDfjcSSLNiH4w4XY9qp5edkLNT0NzKPj+8DubHflDYVL6U
X-Received: by 2002:a05:620a:17a3:b0:93f:34c9:9259 with SMTP id af79cd13be357-94408cde210mr707300785a.50.1793264229694;
        Thu, 29 Oct 2026 01:57:09 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93f:34c9:9259 with SMTP id af79cd13be357-94408cde210mr707299085a.50.1793264229125;
        Thu, 29 Oct 2026 01:57:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb902sm34947181f8f.24.2026.10.29.01.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:57:08 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:57:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dragon@radxa.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc8280xp: add missing QUP pinctrl
 states
Message-ID: <m2sh6dfakwhndlpxsq5kpg5nywk634vicyf3n2c6hcx4az3q7n@27cl3z3whwxb>
References: <20261029-sc8280xp-qup-pinctrl-v3-1-48c4ef292dfc@radxa.com>
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
In-Reply-To: <20261029-sc8280xp-qup-pinctrl-v3-1-48c4ef292dfc@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX3A+sE3nQJEVc
 dSTS847D885hynGb8Uqal4p9BtkSiAQ+2pH3l7AJg9cGuRNnOiXJ9e7cbbw9biRFCa1KRoYoH1a
 Bk9Hcxtc4aLIwj4XTXAOlZtuQRo/sbpTWKFzZTF+YCl9XekKCI16pVq/5XcGIYusweKdoqgGTgv
 j2EXN3z1kEBVNwatQNOUzJl8SGZD5MeKD4L/noTrpOu4IPrkuiPQDSDqghO4MOffMXKhTg+OQ/M
 exj7XRygdPTOitZHd9491HukkZ4EPa9S2oNsTwcmJ87TO/Lu7RdvERSikBPMGTO4+ddAsuTkLf5
 mf0mu9r/bHOm5FuJ0dXr1VDDN6P6ZTwvC8MkGbSNVyKRQCl9qfRxOe0KHw4SJqPo677ooe8rjJn
 io6K3rXkyVVX9Fllomyo8tEGICgSPIKniiwzvDcLGOeUXWiTdh06c+coVBFHIhGh7OqwKGQkpw3
 IHIqfGqGabg2LobG4jQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXyaQzTC1TGFFk
 Tf96Q4PYCmyft3prjrqX5d12vPI+SSZFK5XiVT02CbA/7FZ+/NbSR+6KGwreAgSXPfpz53uB7me
 wSbYJHD0Y76AFk4cTZp0nThZk3Svex0=
X-Proofpoint-ORIG-GUID: QaKaWpG9dBx278YpwxQ89fiA8PfU25dy
X-Proofpoint-GUID: QaKaWpG9dBx278YpwxQ89fiA8PfU25dy
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae30a66 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=__UjJjYY8bcpKF5Zf8YA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

On 26-10-29 15:52:32, Xilin Wu wrote:
> Add the missing tlmm pinctrl states for the SC8280XP QUP engines so common
> I2C, SPI and UART pinmux definitions are available from the SoC dtsi.
> Populate all 24 engines using the SC8280XP lane-to-GPIO mapping, including
> the non-linear QUP instances, and keep the mux function names aligned with
> the driver-supported qup0..qup23 names.
> 
> Define common four-wire UART electrical defaults in the SoC dtsi: CTS uses
> bus hold, RX uses a pull-up, and RTS/TX use 2 mA drive with no bias. This
> matches the Bluetooth UART configuration used by the existing boards, lets
> them reference the shared QUP state directly, and removes duplicated
> board-local pinctrl definitions.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Xilin Wu <sophon@radxa.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
