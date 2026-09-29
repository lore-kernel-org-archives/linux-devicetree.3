Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBE5498926
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685974; cv=none; b=AnyxdYKADtnxPNmZ2mC2gG512UMXSpJhRZzqmWanDPigHlJVHXahCVD6a6UJT+Twx6e9eh5jHdaYAZDTUuBvSE0VW2cCVR+hchy73nmMeSK0TSl04q0X4uKrMPsFWfHyrAlUSBnVzfX6H66GA2+U5M0C0Q0/c1UDQazbu9215RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685974; c=relaxed/simple;
	bh=nIPIQvLtAiBWpuYZ7ZeBGaIDzZ8zCI5CfimqcKJJ35c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMJ4xj4FSBAQ1msj26FZudvLE2ghbgKXSxDIppJQ/ZQdHE5uZ9yA4Ssw3tQzr7SA/vNkqrXR78hVd/Or9s9y6sa/9c/p5oXbWUPeZoSiqgEBhx1rjr57Y/OhcLb5AopEjejASSMaxN/eVQ9wS71ymArAEkbSG4I3jLKQWJud1PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aoYSMtS6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Za6TES7y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aoYSMtS6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Za6TES7y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCENvX119221
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dfppG4LZcjp+lnODDg/K8oOq
	9to8YwqBX2eBOXC0hq4=; b=aoYSMtS63MepcEYleUK5/MjdrKxIw9vSaqpK94Ll
	gax7pcyN6/zO1m7DYfxNHaG+hM6JQWEuWZOKXYac8ltfgcev++lB49Y62J8/PxuA
	5Qk1nQUuzcBKjZNs4dBWqQYF9a+6D5hMY5SMc2h1tcgkGcpkpBca4vrvivOk+ho/
	QuypnBQC7VEYdDGmkjnAMt4oDLhUrfAG9IlVVbScMA2gp5XFKyzwmIVSccP2t4jO
	VmTHQ90uuYM/o9p5PSLYYfmhPzOu8+4MkVGJthdeD2V4cn8n58KQ8R4RwnY5z9ed
	QsQSc3veVUnqnSg9MpxmRVziUftNy7z+82CBFh1EkNJpgg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144u0d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:46:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c77c0d96eso279559985a.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790685971; x=1791290771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dfppG4LZcjp+lnODDg/K8oOq9to8YwqBX2eBOXC0hq4=;
        b=Za6TES7ykdsR7yZEjzCOSRHe9FteEF5pXIC1+zph+TYYM7PLq18PYYjjIVmYZS6FLN
         t+BGcpzwO2uUOFpPOEWsyCDS387XU5D5zprJ9/AJxq/JY9PO7pdv8E+zlM4JMWlEMpu0
         1Wg6voLvpFuMggBrpp3PTU0F4QCt4FZclQyVgm+SBRFcIgE/dcg8AvAT0T4R0fp1WeAD
         w1x/N7ICnQcjCMr5lgcFYAz++kHAfBZMAQ2t67ZJpWRgcnyq62TSGlFpmBoVuScELJc6
         XI+dme1OMuDuKCZpxw7MzQI5zVCxKduOTfpLBtgPlAa+zJK1FF01EFlkNLaz8AJgbsTT
         22eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685971; x=1791290771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfppG4LZcjp+lnODDg/K8oOq9to8YwqBX2eBOXC0hq4=;
        b=hJ3qjl7CAV7H8ukNSUEHgbLzYAcJXy3X/PzrqZWiwoQ1hNkkA1PzUNasSkc/kenTcf
         Nkwmww/4uyG9Z/MWnGK9g2KIoS6uv2GsC97WJjs2prUOxpyFOflmRSpy1AKNoZNZgrX7
         hXNfK4okDIwAfeFFK9Yadtj3rVinIPbgzoXlZCmTfUtcCN0EsS6qVbRXOTKpHEmANV0A
         78Xpfn32rWkLtPHOF5DlqTJofQ95M3GQBnrlUphfBPrtqiTdW3wcR0gQdHzc1h6jh/WG
         D628NRXb204l4kn0kgtC66SqynP5vdbGNNdO7SUHQLfzMCiRL+MX5YM+q3HwP5F3+Sza
         TAug==
X-Forwarded-Encrypted: i=1; AKwUvByFEuReUMsixcGftSWH1JMZvkl8myCACovv8iCK3VLEU0Nw4qxzBzsJG7KT6kenMk4tvTHpPEY98qrZ@vger.kernel.org
X-Gm-Message-State: AFuF++kQXBkR5deIvaoDXGG8QUE6pQhzJnk/oBE23N0jiBhgkY3zbwKA
	BeiKlA/hpM1RcMNGAmdcPzYMqucXtlgVyiSALzzsoGdf8kqFAzH+oiY8C6774u2/iuKrzkpcjrj
	8PAeSMldDhjrQybV3dbJOiuIcOltC4gQ9gKaW+sDzFoFoQbIdRC6a+2VW+8oAwBNZ
X-Gm-Gg: AYBFou3FBK8FbgEYUXonDuwx08koBRexbKoISHFPdlbROlp02uCqkblzXuzDsA+pXmS
	0zZv61MS5HP1nVUCSOGSVnl5mxlnDqOMacAM6tkyXmYGbwr/MfPJ5oKLFX+OY0gdU+9biBNazne
	lS+uSZ6ox5KxGAFXVbXHPdFSASmEgdNPzolWseqwCCmS+ardz4iQgUVlqQ9cB5lxGb9FSXFSgtm
	66awJpkKoW7nOcnWSw5s8+P6Bs4Xxr5T1SSZMCWCIa4F+q8MEFMsE6/ZWDnfBOVFQDxdJCt6+ny
	IKKYzOS+3qdMd/6lxfWkmnXSHxRh5ZUy1+vKJZOxwIoXp9B6Xprhh2ywjWfNbje+L7GR3YNXxgA
	IGa0GCgaaCVY6Wr8=
X-Received: by 2002:a05:620a:2618:b0:93b:d79b:9a57 with SMTP id af79cd13be357-93c43d17b62mr2682090485a.56.1790685971190;
        Tue, 29 Sep 2026 05:46:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2618:b0:93b:d79b:9a57 with SMTP id af79cd13be357-93c43d17b62mr2682083685a.56.1790685970512;
        Tue, 29 Sep 2026 05:46:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50513c7sm3850730f8f.16.2026.09.29.05.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:46:09 -0700 (PDT)
Date: Tue, 29 Sep 2026 15:46:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: fix sdhc interrupts property
Message-ID: <dwb4a6s4wt64agybmd3gbtdhwe6nepqz65ew7wsaufuo74yc2b@3viooou3she6>
References: <20260929104127.3156764-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929104127.3156764-1-arnd@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MCBTYWx0ZWRfXyVrfXmEl+tzG
 EpqgxZPbuhk+bua5SQF00EkdGnz0P25/Zmm5NKIjfbpgpV7RK/qXQiiACGxnraiCpqVbN5CCv4j
 J3rSF43i60usuTJ2OrixTVsxMSLJl46EENJBLaHFgrPjXDCWPn4/A47PjyUfDlaqNPA2bqAakJr
 HC+hcVuwxxB3XLTRd4PwrQpLgPkfiKpnX+EWZYn+Nj7s9xezI6TjZU/FCxlAZG/hXXANCM4sBJJ
 qBITJJalG+kk0Vv6A7AJyvXL5HoZi71UbrvVFkUQHzrL2QybbtqOeGc1VChRo46FoxqJn/lqrIS
 c5aSEZv5FZZ9T3mytgOqAtsnqSEmiSqW7WZaElA2sJyKEdO0JgeTCDf5e5IZSZTaCp0zDr6HXrq
 gu9lAiVic7NivlLWg/VRZF8+azmDWMpj38A32BNihsg0INWOsQI5s+9O4woM8qGIttzKaFX6h7J
 IkvSOj/kIGiRwB5TCMg==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbb313 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Eo4bF1euHd9rOWEQa6AA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: -qBHUbUdbf8TweHP1erw-BMgB_BQfMb7
X-Proofpoint-GUID: -qBHUbUdbf8TweHP1erw-BMgB_BQfMb7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MCBTYWx0ZWRfX3tBfkKoYuIH8
 ssG9UvXvTQQl/dQLBn0NTu7/uX+gqOJS2GOPtFFQIaXwwgn4BowpDb6ba/rElnicjzM04sr0aDh
 ITLrMLWUgBiELmwJRmsL/cBuud8HusA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290050

On 26-09-29 12:41:12, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The gicv3 on this chip uses a 4-cell interrupt specifier, which
> includes the affinity, but the newly added mmc node uses the
> 3-cell format:
> 
> arch/arm64/boot/dts/qcom/shikra.dtsi:4151.4-27: Warning (interrupts_property): /soc@0/mmc@4784000:#interrupt-cells: size is (24), expected multiple of 16
> 
> Add a zero affinity, same as for the other I/O devices on this chip.
> 
> Fixes: c8e3d40457f1 ("arm64: dts: qcom: shikra: Add SD Card support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
