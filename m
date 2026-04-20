Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A942D738A
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670254; cv=none; b=mJdVeGPPFW7lAdckc5gRSo+YRdzcEnqQOk8x6A2U7DtBlQB4urn1HwFIgpcdHWa7uSHQ/c37cS3KBiQv1ere0bjs/3fkrLLx3VI2vN/6uvTc72yh7GRo5M187YjRacgnQY7Pp29Jvr+weI+MM+u+JoNRoWJEVbYiUGopUiZT0Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670254; c=relaxed/simple;
	bh=ibn6J2gHPPBIlT843St6ggbOQWgBWE0BPSrTNLipScY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxhKdpEanhGUQCI5D7EpvyKb9nGQrYpU+1vQNkViodndEl/0VyeGT+DIA1GCPJuO9dKKVdQ2uVBSFDKkncIag9Qg3a5lcAyJ3BthGH1xYjRifQw9WoMUr/kndqyDt1j2cg2vewiq63ykOD/IhIjiMbBKnqlJOFymUvCWCElHc5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfd63UCR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbmdfmgi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfd63UCR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbmdfmgi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K6OV8c1856143
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txlDDEse3giCKyy04z9LcYm6Q2PzX7M+fmm0xi3qWeY=; b=cfd63UCRPygWpDv8
	3FVgWALB+3sQpA5fpXRhsvdlpRGWSYUNrmHCyf8fIadOBmo6gPmIk+LVCZZdOKUj
	Ky5ABa8ig8Vss5JKLhvoozztBdBufUkGzb96nPfVwqZ2pOFeTiXdbN20tsps2HSB
	V29ng2LCi/K/i3B3Y4WjMl6SzlnG5I8zfUzEFlw7vB0Wutg4LMsNNky1DTqA/8Xr
	6AJw76sNgB2xsydU44qOlzNIvZQ/88D13b7kQb6WbJ1VoVh0Irodbf6hN6auhqjY
	87nPEEBbIzKzMZJAK1/ZIMae+8L9hR/JpXWaMSMXSDuIBdhnWOQcKuRsZe6p/z/w
	/S3TWg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2qamm6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:30:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so2848830eec.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 00:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670251; x=1777275051; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=txlDDEse3giCKyy04z9LcYm6Q2PzX7M+fmm0xi3qWeY=;
        b=hbmdfmgiIjyneOTPp5TNlE3ng4LfYQZL7zuwHehPeK22Y1TuGAjuTLTjpC6Ty0y1qR
         U6ldHmLlpIxjyuoAMvAElYg9AhmI51IxxDiogR3pb6Ugf7iAPGh6NyBjhI20488tNS/u
         XsV0WBeBe+C7bx6Vkt2slnj5CTm20Hg5hK0V5KIoZncrmexjkCn5n5aoisgBq97pZkx/
         ltInwmXfuFS15bgdGfZMWOd9O3yfqHSG+2w2STdi2nYLLytYnZeZ1a/jHuVS09RVRuGr
         fViG7od8sDeTxme6hw8WhZkFoOm5XeijBgrZcqLLvS3fsToTNe7135BdsQb1j+9M61I9
         zmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670251; x=1777275051;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txlDDEse3giCKyy04z9LcYm6Q2PzX7M+fmm0xi3qWeY=;
        b=htrCvx01lDJYpQeJRcAnIUO/GSJHCv2OyHFZzev7yGC30Q3leD55lXYsEWeL7Ini6L
         yH7n9IDHHYnMa/fjgZpGpuZvdqfPj9fw3TWFwJJxWPw9c996gTUTtVMaSswczOTSVU4C
         87ENI7kLlzXYpxRzaNHtS+/o6XMCg43UNK+I6AcNqi8RGVQwe1pr7nKls+XleO2BA0GA
         03B5Lzkrlt8LINkoxid70xgCmZUAMGrQiKCnaFqLOqEm2s4xAsE1mBKlaUi/mxD75gtC
         Aa/C25Ir/m6B6KeOOSwrjC7b99LJeg5gStBJCLsn2tykN3KjX0dkdHXhUYtp/p+bXr4J
         ckMA==
X-Forwarded-Encrypted: i=1; AFNElJ9W2clnRqLnzmRN5i8KL21bwJ9KVMbI8Ao/t6e7xQCppkZoxBuvJQZF6a7zJp+tbISGV7sOPhYsMAt7@vger.kernel.org
X-Gm-Message-State: AOJu0YzBCzqashDITAu0iIFA7gfiK/Zx9UNIayFkFiYsD2k0WjfkqlWj
	frfv8BH4UgKnhX5BoQhOQM8IWqdhn8xKtvbh62tDORBzW8Mk5gHgNf55bZMAp+3HKnFbTSTon6M
	zRvDsYQPnqM7586edjNl4IxYYG8GJwOeiJTqw3R5o1J2UqXcwzTqsCVbxCqRARsMa
X-Gm-Gg: AeBDieuYoKQgX1JRmzQ2AsCMwvyUdBuhxSypYBWBx7Fm7eJAKlIX81bO2poe21janYU
	2LBEjpjghVwE/wKk8DemwJea+mbgm8ejL55P4dlP8IWXMOc4x9+umRnhXGQyNwUjZ6t2XgOsWus
	Hiw2Nfo/e3IaVG3GGqtRFPwArrarhcocTv2HzOaB/XcbA43vYTOKRsEEVqDHw1wqvuuwurykdab
	aQVExzY53Iv/e6BSCWzRql5TFM9sRYQbTuIaTxRuBVqYlee9pOdcH4FcThCT9XDEDawqST1pDWq
	7twjGPMB1sIiU8c6Fg4uKMdGCctmzbSgDhKEZP32EdskogG+JRQNkzETqIMMd8xZlLSPe2UD0Vg
	9CF9dwfVu9IA6ga/PIPO175xx7raRjIkDqefnrz5s+Min53f4nsBzeV+EMaJIf0iDOCf+LoTsKO
	lIsAc=
X-Received: by 2002:a05:7300:2d15:b0:2df:3eb7:531d with SMTP id 5a478bee46e88-2e47a102bc4mr6036475eec.19.1776670251302;
        Mon, 20 Apr 2026 00:30:51 -0700 (PDT)
X-Received: by 2002:a05:7300:2d15:b0:2df:3eb7:531d with SMTP id 5a478bee46e88-2e47a102bc4mr6036454eec.19.1776670250682;
        Mon, 20 Apr 2026 00:30:50 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm13657396eec.18.2026.04.20.00.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:30:50 -0700 (PDT)
Date: Mon, 20 Apr 2026 00:30:48 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arch: arm64: dts: qcom: Add support for PCIe3a
Message-ID: <aeXWKOD/I5kFaBfz@hu-qianyu-lv.qualcomm.com>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
 <20260412-glymur_gen5x8_phy_0413-v3-5-affcebc16b8b@oss.qualcomm.com>
 <20260415-pragmatic-termite-of-attraction-3dbab5@quoll>
 <aeBWfv1oXnSQC454@hu-qianyu-lv.qualcomm.com>
 <d486616b-ef21-4933-aaf5-dcba339dd8cc@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d486616b-ef21-4933-aaf5-dcba339dd8cc@kernel.org>
X-Proofpoint-GUID: Vuwz7gnt52CI1HqMEdM7404iuHOXyhMm
X-Authority-Analysis: v=2.4 cv=KdDidwYD c=1 sm=1 tr=0 ts=69e5d62c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6JBNvcu5I-RyS6dicrsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Vuwz7gnt52CI1HqMEdM7404iuHOXyhMm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3MiBTYWx0ZWRfX+U6d4LTS+5Xq
 6kNQ63YMvaL0FZEYbQF6I74kXz90y3TOrMEe8Q1xgl2fbFiTmYam8Y0VnDd6EjjQDFCjPhoVjKZ
 u/mHVbvbAY30QVlWb5KR3/6+8x+DTBvAHH6RQXuUtM2Dy9DOsLwsQFGRpLjBiI02hZRaKzSBxLg
 iWeaGyoVaqkOohVDG5Txy5zDBmb84SO4lusg0H+I4zamZOrYHbu2aeAHwSoHnJe5qqnu0cHqwjD
 EQh1ZXistsN1mGt6EsGIx0MMEdMlE/PQkhsC583bNPdTOanqipOUkL2ayaM3ZJK0iDGvDWbLBnX
 IU9FH3TZgU4dKb7PuCrs4iU9YWRNqM8G+gigH+6jmSPYmwi5cfw/TboyzhXYBy+egR67nm4wKlr
 jILDJrvo05MOGtpZbbJL8qLzrSRUbOfCr8Vqj4ASW1L9Zw7sIzPh5tzwzPNmRXZ5CAMMRa5Kp+I
 fMRICb/E6q2qyWae+ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200072

On Thu, Apr 16, 2026 at 08:19:09AM +0200, Krzysztof Kozlowski wrote:
> On 16/04/2026 05:24, Qiang Yu wrote:
> > On Wed, Apr 15, 2026 at 09:44:15AM +0200, Krzysztof Kozlowski wrote:
> >> On Sun, Apr 12, 2026 at 11:26:00PM -0700, Qiang Yu wrote:
> >>> Describe PCIe3a controller and PHY. Also add required system resources
> >>> like regulators, clocks, interrupts and registers configuration for PCIe3a.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>
> >> subject: drop arch.
> >>
> >> Please use subject prefixes matching the subsystem. You can get them for
> >> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> >> your patch is touching. For bindings, the preferred subjects are
> >> explained here:
> >> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> >>
> > 
> > Thanks for pointing me the link. I’ll drop arch: in next version.
> > 
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 316 ++++++++++++++++++++++++++++++++++-
> >>>  1 file changed, 315 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >>> index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..c15f87c37ecbad72076a6c731f4959a1a8bd8425 100644
> >>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >>> @@ -736,7 +736,7 @@ gcc: clock-controller@100000 {
> >>>  				 <0>,				/* USB 2 Phy PCIE PIPEGMUX */
> >>>  				 <0>,				/* USB 2 Phy PIPEGMUX */
> >>>  				 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
> >>> -				 <0>,				/* PCIe 3a */
> >>> +				 <&pcie3a_phy>,			/* PCIe 3a */
> >>>  				 <&pcie3b_phy>,			/* PCIe 3b */
> >>>  				 <&pcie4_phy>,			/* PCIe 4 */
> >>>  				 <&pcie5_phy>,			/* PCIe 5 */
> >>> @@ -3640,6 +3640,320 @@ pcie3b_port0: pcie@0 {
> >>>  			};
> >>
> >> ...
> >>
> >>>> +		pcie3a_phy: phy@f00000 {
> >>
> >> Same comment as before.
> >>
> > 
> > The existing PCIe/PHY nodes are not strictly ordered by address. Current
> > order is:
> 
> Obviously we cannot even keep order of nodes when creating a new DTSI
> file from scratch.
> 
> But adding @f00000 after @1c10000 makes even less sense, regardless how
> bad existing code is. Don't make it worse!
> 
> This goes before phy@fa0000

Okay, will move phy@f00000 before phy@fa0000

- Qiang Yu

> 
> > 
> > - pcie4: pci@1bf0000
> > - pcie4_phy: phy@1bf6000
> > - pcie5: pci@1b40000
> > - pcie5_phy: phy@1b50000
> > - pcie6: pci@1c00000
> > - pcie6_phy: phy@1c06000
> > - pcie3b: pci@1b80000
> > - pcie3a: pci@1c10000 (added in this patch)
> > - pcie3a_phy: phy@f00000 (added in this patch)
> > - pcie3b_phy: phy@f10000
> > 
> > Do you want me to reorder these nodes to follow strict address order?
> 
> No, but don't add nodes randomly or following the previous broken order.
>
> Best regards,
> Krzysztof
