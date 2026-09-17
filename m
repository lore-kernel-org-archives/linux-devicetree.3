Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235143F075D
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657909; cv=none; b=co5acDaVYoEfB8lbyeWUxxjORQ3byqKiMc8Wdbc7zi93gyAQBda1JGyqa6RDyypYafhBsfSlKt59cBPjmf0tg0W/RuOwECOQk375wJP67oZ5fsYPuP6w2e8d41UbTUG4i+egKIVlkwpc3CHoA9WtjPYccWzLI6oE3u+7O/jcNIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657909; c=relaxed/simple;
	bh=oHhMGJ97KbFYv0KPwuP3HgdQt2KJw4wSr7XuHN0THlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INU0HX+erfphj+TnFY6aTEzx6e7NBRymMMtf0l4PDy1DthP0GE9xnBQhT1rWC3Ijk1SNHx3GBMygIhnMYzrv7doyDSZ07SHSAIE4Cyd7oopf7/Fqm8MbNnIXstcbCSAd+sfSV20uMrXuHTu0OY6/0zf736idefi7DnhnZKH6qWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7zTwMCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJivzEmR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7zTwMCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJivzEmR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDkQrL1956155
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sB34Y5YewUpC7AQCZUi/yvB6
	QiCcoBSlNdVX+1eleX4=; b=Q7zTwMCvGFtHwpwWJsJJH0ZAYIvh0Vq+53BrYkGO
	ZnBLtV73WffQCUUlkVvpXg/EKubS5LY+GET3+2OYeuXHgyKkLWAOA8ycKuqEstby
	3ngRELnJsZSVlh9MnWsncEKVTVzVtfPvkDn97qhWGkdDsTfwoIoZaw5m8iEx/tXN
	0fDi1RCIT12z/pwW/Z8SbDd1UwgyJRtlC4X45WH5Hm1fmCJlGXzmDfBEhHXSUI3D
	kMTi0Fk4h5XtH5IOt0TWenK3ATDvHndeK0ZkAkrT9//3P5063N4Qdo2yQL8M8vog
	nsnsxjQaXHae6QO8Na9MAWxegukzU5k3v02ytjXy4sDNcw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grgu5gn36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:11:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903622880so192837985a.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789657894; x=1790262694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sB34Y5YewUpC7AQCZUi/yvB6QiCcoBSlNdVX+1eleX4=;
        b=EJivzEmRZKiFyFmuCQFD3lYCzfxliWdFU5Tld305KDQFKu54kmKJ2lBHhP/EJXDGpk
         9cIZ3zxR2WphfDzPmZxMeyKOD0a++tGSDEOvHX5hhmXlRPlS7RW9Doj2MjXpSyqCrVQC
         PyY/dAhWjTCZmGf7ZAKyUMNAAn0Sh2yyxzplXdh19KhxFGDZGq8I5G4AuSKLTn/H1Nfd
         BITGPD02ozggEXzSwNxtkp5YxtsEsI4VclbwphTY7U0FFL46nG9eyV8NH/eI+obPt6ZM
         pEY5+gCHkzMkbg3mHvTcYEC83fonSErOs+xphJMnYNjvmFBYnJiwEoEikXYJWJqrjE5o
         5Wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657894; x=1790262694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sB34Y5YewUpC7AQCZUi/yvB6QiCcoBSlNdVX+1eleX4=;
        b=slRyWAlCAy2uESOjy/3nnNGf1OUa6Z+KSsPTm3GALLLaYsrfJ6k3k1dHEdVM359FXz
         qO0Hrf//ZnJ3TzPui9u+ephIYBT5dX4zlmXCJv2nfq4vMMiZ4ipxA/rCUN0obqxn8J5d
         s35g7TdXXH0/vsmFVACzalswB2+6wvOwDmLh6zKFqvts61b/fYoGmNPu9p6tiss4i1/4
         Ul5c1qc8kD2q2zD5t3ZPaPJ+K71pDrTOVK1XfMw/huxb73XOUUP72GD8tExgHAYl8c3k
         wxt8dp7kaLzu3sbLAtCxMGfbX2VUaFWh/jBqr+hNyqTmHEiLTgGAdkMXQJl+dW2+f21V
         JovA==
X-Forwarded-Encrypted: i=1; AKwUvBxO3seTiEv/dsJ085EFbqOqvCG6UhWdSBOY5ftg8CTTvhVgSUkcj1nHWAvnjMCBU5lECIxZB+XuoziX@vger.kernel.org
X-Gm-Message-State: AFuF++nl4U7HKHlkeos1DyrsVtorG9Xa5/BHopytd3+PiU65kZcocH7X
	PB5d3W6bWKBs/gTOFmgO7UGZEh06KVtd0Gi/hpnCDI+5xdqmGcxLg0erMtdvTXs3ZD5l551XkJZ
	nvL2HxmhEho3GYSaiSsNqmV8+Dci+MHzqqASiFYyRF3hPNAL9/hcIz+QSsrwi8C2AkdvxhPBe
X-Gm-Gg: AYBFou0xW8Vb15sWcH2/TpI097isOHM0TRW4yV3Xt7RvVmVSTSFTVX/N6b27y700jio
	9OXYeied5Qiip9lVv4XNKzayqdHCqzFFfJBpU1iwbOluFhKL0GCeRD8y2Y5NTawVaccWwvbSo3y
	WPYGaEn5caDn+54z6A0rv5QbF+2mmHK9dFWpTFlRAQUuydbHEerDw1Irn3/zSYFeX6rfxGsYP+s
	fUzWQeOTK3Gx0RB93wSd+PmyFqV/Brzy3FK5S7n4q/ClLQ3PoyvlcZT1gK/Dmi5D8vIIbXuOYUA
	fdWLDv/tKE5IF2nYM1CrN+YbX1MaXI1dV/hlD1A2B1tu52HDjnfVzX6Doe6eoewSzC0E2Onpu+Z
	DLkaCQf1B0wqIhQ==
X-Received: by 2002:a05:620a:2687:b0:939:e7d8:9c04 with SMTP id af79cd13be357-93bc62e126fmr583774485a.21.1789657894166;
        Thu, 17 Sep 2026 08:11:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2687:b0:939:e7d8:9c04 with SMTP id af79cd13be357-93bc62e126fmr583768985a.21.1789657893513;
        Thu, 17 Sep 2026 08:11:33 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa70sm16097557f8f.9.2026.09.17.08.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:11:32 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:11:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/15] arm64: dts: qcom: msm8998: Move PCIe phy and
 GPIOs to root port node
Message-ID: <osbej5tk46rjvbppcosn7332tmw2qnzvt35ctcukd7gcg345gs@tcu3zi6t5bo2>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-2-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-2-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfXz4KKcQBwU/Bx
 m5S1wswzu+aumNFrD9AmrZ/qFpFbTgGKghicV4LWRAkvsRNhpPtoI255UcnoXo4ngTJ8rCnyNoH
 6SD7DVvvzfQCOQiuAHqi6QcTPyQRM4Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX7PWyUSNvQq2p
 q3jkg0Yh1JDuQphMcDNHRDknUFUF3SWkBrB0HEjC1CaEjPQazv66OdtA1YZy1V7vqajTguqfeCY
 8RoVIYpxbXPv9psGNLh3ynwJuywFTL85is7DcLeKcV9YJ0UF23IeteykO3uXhpYee5lT+B8DsId
 vkl81HXm6PlcN8/ArXsnyvsrm6g2w6Mf/YfQsNZ4yKcijLLNoYytsThw74PWDjP74VG/RpWnJDd
 3+ZyjguZe2dCAjcz+KNCJ4gTl16S9ou2H2Ssf9GCVNd9CIP+jZwFoNGjKu9zYFsu+V+qgoVKRET
 7ssdZ40CU/namh1Qsf8w+dEuyrZ5Xta3pT0zW+nKNXptyaNbcVpnXXMg4utw4iYHJRVu0aAUoWc
 G2hYRXGoTGKF3pytG0oTX04SpMxE9iHWqodFkkY2lrTQyzQwTR+RT6yb5Qp6X83xe1IUfX2aXL+
 IMPlV3uVxgMdKeVuuIg==
X-Proofpoint-GUID: HPtxbbuo7Gq6-HrVGiBaq95JO0kdfbly
X-Authority-Analysis: v=2.4 cv=GvbXaU1C c=1 sm=1 tr=0 ts=6aac0327 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: HPtxbbuo7Gq6-HrVGiBaq95JO0kdfbly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170214

On 26-09-17 17:55:16, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst GPIO property are per root port
> and belong in the root port node (pcie@0), not in the RC controller
> node. Move phys, phy-names, and perst-gpios from the controller to
> pcie0_port0, adding a label to this node to allow board-level
> overrides, and renaming perst-gpios to reset-gpios to match the
> binding used in the root port context.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
