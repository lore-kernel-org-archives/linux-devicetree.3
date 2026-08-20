Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6122302CC1
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219220; cv=none; b=REM9gXCS+3pV875MdKudnQYtmpV2Ruk0PCdErfNIrG+48OVDeg0x+T6a6+cIej6cWQAur9v8pgQ+NaQ7Kns8YLdZW7kKyi0XgIO4R+CBvszck3pbF8hR9HsNe67uoLVnzYp8eRGVq0bNDYREdfAbeWVi0X5gfW65dewfG5emkbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219220; c=relaxed/simple;
	bh=iDH+nyelyD/JV4iokJkdB8QOLatA1sqp42eElkpny3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jztg4xDZbkBFXlXYuC9h9y0yXWs8oUgkPcIliJgH2Hr1f46CJOYTL4P+wdw2yOXkrrBSjoCQbAf1O9Bmg84U7QdUkPw9oRYYOE9O8Elh+KtEUw6wbMIV6MHmzV3K6VS3fy03HNJjNc9aUNFsEq9N7Ubz8dQff9OUQIFFzLx7Mpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIWiud6a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UXQtdwkl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIWiud6a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UXQtdwkl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K64wHS1778042
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2/+At+cNTnKuyLOXyiUGjsSs
	wthAb+WEn20Wg2h6kK8=; b=lIWiud6aqv/XfoiJpM47kS9HPDXYJHSlkkrcFjrt
	w6xZEn+hfHGJhPb5hPSo5JX321qKYGBcOy86c/eUZ3RjxNjVMqwzjXNrjM+7ZHzl
	TlK9Q0Zc4lgcnFP1rY9c6J++R32dmFcOCwJ0loWjYj9drzTUZTNePBRXSJfsQECN
	5S26JBLarqSPufWG8AZRKWGSofRSur6HlBwxqNd66mSYpMHALK+rUJ1cKvvaqLPF
	N3ltnuRj5skDP8mr86xSDHlpTZkfLOU2yjr+M65+AQwP2Bn+TxlsJ9hPRsGmnGVu
	MyuBgU2Ya3PgNUOFQUf50wSci9io9M4N+h0n3bjSYPrQIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es3m6ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:46:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93730c7c73fso33088485a.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787219209; x=1787824009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2/+At+cNTnKuyLOXyiUGjsSswthAb+WEn20Wg2h6kK8=;
        b=UXQtdwklmu32Qf23GQYoNIvjMjL1eozca76SlTpVZSisa8fTgjYNIOAzg1oRFuH9lx
         qdgJj3GMoNleoOmKu1XWn+X8eDTY6w3Gmod/67ht+LO/UL7c5aOiEhpHeLu9E5qYW7nd
         bugPJOmwi28ImW6wnp0A/9VGLXTuoZwJFBSB/lktGhKXv5/4yYGEhcG4RKuRe+tXBErK
         WbzdZnosn+aTgJOy1kcJ+2YSE3l7FNiWosU7sJtK+2IaPIpfurOglHd1MMxUkn/tRwpi
         LkAQ/PcP1cHAp1WvVJkHAN+SUyA/S4TmbzhibYu529Arp5daUsAWZBuSMW0YyqsDwEb1
         LD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219209; x=1787824009;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/+At+cNTnKuyLOXyiUGjsSswthAb+WEn20Wg2h6kK8=;
        b=kdM0fxiYaIpYsmtBEnigDqklEoHgp5e5cps6NCG9PTt6hAHmKYKwJ6u4YMzAZn2lRh
         NnPusVh1D4Zr+5jUdx4/HsGwS3xsXybOtfNRx4Z6mLMyBGiUtAW53HG0+IXF7KRERpH6
         GYgJHa+Z6G3YbRUSmQ/rperyvt9JMcfgpusTRT6xW44mToamU8WuaRbddOmke/sDv1Cr
         7OyCdlNKPEbtZL7kgkfyuLbSnugDQ5QOoM4L+oQdzeMAbBYwCpzWesx6NwIgXy5X11U4
         dLHNiOKjfy2e8QA9ri8SXguMtMqxIhIS9kN+9bJo6tby9AvDYwG1fTwRjpTsqNmx5ZXa
         8ZxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7bFo4GkXjS88saMo61nS88+hsM4t3hQ53N5s4xVzb+zLgJSy/TqQQC3eCRGtkfl5aEnKmIsYQsGmM@vger.kernel.org
X-Gm-Message-State: AOJu0YwzEMhzWjgeDelzGgwDTCk2RRGQ7UV34m5v6ZF6l5muFUXdVMF0
	KoixI+THCWAmfHK+GjDwgdaEYZecaDOh32zs+LkvXCw4MU8Ked9CS8oWsspjvSK1XXPqVwcPwJM
	UfanoxeLMzoP7ggK95wqc4kRaHwzsRvSWlDFxQhmuBQ5dvTVCHDyNBteMm+tfuF60
X-Gm-Gg: AR+sD12IGNMiVfZ05d1MhunqoLnd4rBiBZrJE0KnpLxnQqJb6Xn4SCUzA0p5jV2/LTa
	pOgVYV7VU+fYqZmDYx2AnW3VsBcUSeCsEFkHfAYMmw4ZYhJYl+LRq3AG9doW8kWV6y35cUYa/fP
	/DlndFDGGuCOMEgiRbHCEnkltwK7nW1oE+IyW7IyJBQJT2NnqU7fppGyZ4xjl6nMy7BO+zGv4Io
	Sco1lXOV0FmvTarxbwC5aiN6y5abkw2r5ScGU1rjUJhck6S1QidABI6a5et8X/bY6x0izcBY6RK
	Y0IYhpcxjPFZmK62AgM7Urw3Q8vmcc6DaVwqe+DucECI25EKL0dSNfpwIotKr5CuUw3gnvjsVtT
	4DMIpsMmqy9qFW+M=
X-Received: by 2002:a05:620a:4152:b0:92e:f3ca:2eaf with SMTP id af79cd13be357-9371e23b365mr1023560585a.11.1787219209050;
        Thu, 20 Aug 2026 02:46:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4152:b0:92e:f3ca:2eaf with SMTP id af79cd13be357-9371e23b365mr1023552785a.11.1787219207172;
        Thu, 20 Aug 2026 02:46:47 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1111b2sm179934075e9.5.2026.08.20.02.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:46:46 -0700 (PDT)
Date: Thu, 20 Aug 2026 12:46:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
Message-ID: <cpfh6scrn725pdpfn6xuvdmhv3pds34olardakbwstuos2rsbc@er3alzckvpn6>
References: <20260820-shikra_dtpm-v2-1-bc6698564ed5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-shikra_dtpm-v2-1-bc6698564ed5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UIrt2ify c=1 sm=1 tr=0 ts=6a86cd0a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VPIKziwejObZ-StCHZ4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3MiBTYWx0ZWRfX+3DBjJijAAJX
 RzBaCUio3Pi1tgkZPHj3W4KTkwkI3y1BS5NswUvvjGUwzZrk9WzgASrVS9f1NCGAQLba8iZdmke
 gJEHP181rEdDujB+ln1nO203+2UD9UKXyYcRWrJU3acn084MdKEeCuuJzEvHOSEGQ4iUB2LNyUl
 lfTUISfSqoyeWbVz++a37fEy82ZzC1OATrFptj4PzHzglheAuO1HlhO2bRi0ETTpjVU0tGqbHAb
 pvePIIwIN6fmsh3tJ8kPeFURw+LQ6eS96I2TqSepeUY2cz8hc8NW0iFLJJmwncIm70APYU8bspE
 WRm6JkHkudEDHR1x8fUPKbzRViDfs7pbJgpM552Me1keEJkX4tPsNtnBUtZtlR+kNopfQtWrayx
 +w7BOjvlibmBNRAite3i4fbtaHEWgV7be9CVQ69+ynQREojxy4X7aqwmF0qsJElm1DpkeIfSeaZ
 OHV+Sr3tN5CHzvkcayA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3MiBTYWx0ZWRfX0VzzuFrXFyW9
 VMptl3XgetXcn+CYWY9utEh+rmauEtXoZf/zc1tUKpg9lsq51VjTUCbW7w2JjJygHchAd8+RoYo
 b1lk4Sp9OJgBUL0nRJu+RvgMiFa7M/s=
X-Proofpoint-ORIG-GUID: rGV_GvWDVJ9WzMyWM83KR3gFZhD3Psap
X-Proofpoint-GUID: rGV_GvWDVJ9WzMyWM83KR3gFZhD3Psap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200072

On 26-08-20 15:08:00, Khalid Faisal Ansari wrote:
> The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
> connected via SPI5. Enable the SPI controller and add the TPM node
> with the ST33HTPM compatible and a 20 MHz max clock.
> 
> This change requires SPI5 to be enabled in shikra-evk.dtsi [1].
> 
> [1] https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

Also, you missed some R-b tags.
