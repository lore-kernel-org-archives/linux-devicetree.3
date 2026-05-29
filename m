Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2B53D0937
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053462; cv=none; b=ot8Dpcuuo40sFuSg94FDmGJaPCRutL4OnUFT0oEh4qdysWyZ6+S0oOjF5F/4u048aHxMJ5Hdth8lUymIirb3Eqpy/HesItxDhiqyQRxs3VLUZGeS3jbmxHl6gUDf1wGQX7IFevYyyOsFfYmRDvZlNJllNLMvRfhYFplXnzMI7NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053462; c=relaxed/simple;
	bh=IBmlyDzfF8aWtyA/qYIJJU3gS/F62zvROpfr4+/L8dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTeCRLdkPLzui0LO9i92wsHT+IN/eTVSPKLrg0ZFeh1DJam502xIdoSww4XIoLBTK6eOlzb5NLcBIWGL9E3Q1BDLuWijaBsfC8flPy5wyVtUY0gK/DKbWgiZQ7T5dh0RT88RoXBVXWslMKpBu7kwS7f5MeCFZT+i2UFwR0uEvJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLwaQyR6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PlMNcrOX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLwaQyR6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PlMNcrOX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TAZSJq4193347
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QkmRn9TbcwNckCQs9FsSZUZ3
	HeV/NcF5t61EORQ7sJE=; b=DLwaQyR69nUcXelnPWKRnkTrx2e4E81OE7q/XE2i
	Mr83OaX5vhha+rI/Xm/Ks35OuebAFHtvnv+G4hjsisslRk/daKbPelLppc8v9Plk
	3kORx3HDRIKJx8Co7/vuvsscB5uTdJ3qQ9KZSZpylNG7hZAw7TjAzeqaaXJGngR+
	q4BpMjwH947CsfkVCRPL6ApXW1AHc4GegBcd0UX2Y3B4AM0EKGbBKtn/FmgHMcfV
	5KeZTZ9m6oevUletgbUFdxmxqJjpfX8WJ6M6W+E42FZiRorIklABnq+KUAP4P5mU
	HMMz1vM0DtGoEWMpxyPfre+UyK4hX7PFnIsEEb1iFVS7cA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te1mya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:17:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516da5a1db4so150853731cf.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 04:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780053459; x=1780658259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QkmRn9TbcwNckCQs9FsSZUZ3HeV/NcF5t61EORQ7sJE=;
        b=PlMNcrOX+2sEGA1fpwbRy8jo/JdPU1zhqitYDKD4wdIhTEKNwX0G2PZia86dgo3Hdx
         4EI5S0nzsYOWFIAudvluddCFjNXaHj/xnAa9gvfBKZUUqX43ky/+vWP8gzsIBdpF8D45
         pFxUVUdUgStoUUeooPCW7/eWqdc4a6J3NMuU01W6F8d+eofDbErFb4NbyUjuTB+eG9cf
         P3BRbccEEF4JUYOlc2iaeXE13D0FqSZnnL/AVrKLdInWT7f+4m2xZ6GltnzVJinnvHEz
         1fJ5gSDFKu5URipU/4abVdTRYod4xQRPqsRqRO+yf5RHwYDq7ijIH///+RwNtj6V9wRs
         CqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053459; x=1780658259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkmRn9TbcwNckCQs9FsSZUZ3HeV/NcF5t61EORQ7sJE=;
        b=GQ6Mqv9Tlb38BzMCq+1H8RA/UudastjettstnXshDKqzdW44DoZEcsdLtEwsYRoCnl
         HTH5UVP/cJQMrRHjLVFOEJGz0+zoH+whF5adW4Eop3bxpudfWsYOvmM9EujhDlAIUh2S
         Fvm13pSFW1+3GxzU7+VTjwWWnVcyJ12Hhrk7W/LzYDaeEkFzwQrXS9/GxQwdmxhLtXjI
         sXU2oERqQsWH5hGLE1VftpWoV+hgApR7jixyxuDroudCStwZly+yk8xJAh+xbYsdkkxg
         i/Fk/Cps2baB8DPUG0zpJKpr/CZX0YqJd+UPwFT2Qwk4taYJOnhwlwkSM4RDs4R/tPhJ
         fwsA==
X-Forwarded-Encrypted: i=1; AFNElJ/nYejClIkhtx2pr7hCocz2L5dvWnU/1Lmg+xbrEDwupVNK58T0oycuHTGhpAqaVBfikv6TTOz0I0WK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd9RXSlyrd0u5uF/umiIT7FSPZJG9sWeFTU+FA/39dVEt2d7Lq
	Fz4LpQ44YcsDmoopvHXEdCKtqcB1aPv1zn167EFuz4M/DKWITUPgD/gosLMnpMPtrcT9etx5klz
	DwdwtmMWuvPTgm9eGxSapZZrDgv58Lgv7ZSy3xtIOWGDddEp50aMuqjvxVoPUWXp0
X-Gm-Gg: Acq92OGLPJGGkboz16Ism0Mj+hpbYBIpRoLlFuu/V04M69PIHmvO1S2V+9QY/JON01N
	7e9BxExVOBZyPVqxfGpvIPmcbG31dHacFBJ8+TapxePKtfIPoJadwjEhTTihiIm/PF5zCbhyYNa
	SCAaphNREBQJRTVXJgzYeu8/k/HWFDBvM5+rG9aMzjKA4qV5AmSu9xRo8xrC5+8E157RfpazHnv
	WHj5uHYPVfBn9yGX/h0/HHdqO65TCW2sXdyybQLBnV7kysmmro9p1k9vKiSK/TFa2Ni6RunrA6h
	3TD4jHKbpsZYJdO6vfYY8oHHU4y4P6GmsT7XOS04VEDCDi6bsuLGdScyK58PFLq0roWrtblNCuZ
	r2mqIH9+frWpOqk6CV1W/lWN8lwYfASiKj0rNNJOI1leXtpqza6mPyUnnKYexZD8weCLe8AwGd3
	0cRH8vm71XWG4+Y+HMXSbuB/CGhg3rNrxJe9V5W4BEkzt2Hw==
X-Received: by 2002:a05:622a:180e:b0:516:d70b:25ce with SMTP id d75a77b69052e-5172dda8cf7mr30123851cf.55.1780053459052;
        Fri, 29 May 2026 04:17:39 -0700 (PDT)
X-Received: by 2002:a05:622a:180e:b0:516:d70b:25ce with SMTP id d75a77b69052e-5172dda8cf7mr30123261cf.55.1780053458455;
        Fri, 29 May 2026 04:17:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b793b9bsm211741e87.71.2026.05.29.04.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:17:37 -0700 (PDT)
Date: Fri, 29 May 2026 14:17:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH 09/16] arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS
 remoteproc PAS nodes
Message-ID: <urft4kklev3palxzpkrbif3jx3fuwdzlj7weyjtodl62vbbzto@v3tpmfvsrlku>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-9-f51a9838dbaa@oss.qualcomm.com>
 <4guumv7ve7rshw2pjvumenopxsefha7hvj26tw2pgayz24ytxk@iry6qyqqqs74>
 <cd43a941-5672-46ed-a9e6-1bc134c94e03@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd43a941-5672-46ed-a9e6-1bc134c94e03@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: OXgc2EIukq29zEDPlZlfqOt9Bdat4IP8
X-Proofpoint-GUID: OXgc2EIukq29zEDPlZlfqOt9Bdat4IP8
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a1975d4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=I4w7QG70X0q2cnev5jYA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDExMiBTYWx0ZWRfX5FclHHuUbMdg
 fpYfRankI2aVv7zYgXvTQ6caWpNDypVpfkoKafAXSVsoPEdGZF/0HZClNp6/oDSoqL/92qGu+AV
 CtvDhLN6ybgMfWwChg9HWky0ecKsyiOUc3M3/2MUusme3EcwtreyoCpq6diuJ6g1R7HdWJYexF9
 ieaZe9aO0wE3bXZ06QSG+HTh1EywUpgOtZmwj4EEinViYarPbIGs2SYA3ybA+T8F+l07Jh80lLi
 ErdAj/cZzNMBb3qapKaAGuJ9FuWhWxMFm7aMyX4uXzvpwHAbiCNmWRhoky1MqN/wLmcgIqr2v+D
 6qLhyU/Jl0tfOZnoJ4VQ93a6YBGTbBcryExif4Ctm+xrRHqwGkv1cVvdn0359m+WvHT8iP+mUZd
 VZMulKQm7Itj1jrsmKu3cZPsaG0lzIUK9jhwKtv8iBqhSiQsJWmRxnxHWDLnR3yaFmRmwYyogNJ
 /cKPN+EF+tKOwpl/3lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290112

On Fri, May 29, 2026 at 03:41:50PM +0530, Komal Bajaj wrote:
> On 5/25/2026 2:57 PM, Dmitry Baryshkov wrote:
> > On Mon, May 25, 2026 at 01:19:13AM +0530, Komal Bajaj wrote:
> > > From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > 
> > > Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/shikra.dtsi | 164 +++++++++++++++++++++++++++++++++++
> > >   1 file changed, 164 insertions(+)
> > > 
> > > +
> > > +		remoteproc_lpaicp: remoteproc@b800000 {
> > > +			compatible = "qcom,shikra-lpaicp-pas";
> > > +			reg = <0x0 0x0b800000 0x0 0x200000>;
> > > +
> > > +			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING 0>,
> > > +					      <&lmcu_smp2p_in 0 IRQ_TYPE_NONE>,
> > > +					      <&lmcu_smp2p_in 1 IRQ_TYPE_NONE>,
> > > +					      <&lmcu_smp2p_in 2 IRQ_TYPE_NONE>,
> > > +					      <&lmcu_smp2p_in 3 IRQ_TYPE_NONE>;
> > > +
> > > +			interrupt-names = "wdog",
> > > +					  "fatal",
> > > +					  "ready",
> > > +					  "handover",
> > > +					  "stop-ack";
> > > +
> > > +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > > +			clock-names = "xo";
> > > +
> > > +			memory-region = <&lmcu_mem &lmcu_dtb_mem>;
> > > +
> > > +			qcom,smem-states = <&lmcu_smp2p_out 0>;
> > > +			qcom,smem-state-names = "stop";
> > > +
> > > +			status = "disabled";
> > > +
> > > +			glink-edge {
> > > +				interrupts = <GIC_SPI 286 IRQ_TYPE_EDGE_RISING 0>;
> > > +				mboxes = <&apcs_glb 9>;
> > > +				qcom,remote-pid = <26>;
> > > +				label = "lpaicp";
> > No FastRPC for LPAICP?
> 
> No, FastRPC is not applicable for LPAICP. FastRPC is primarily used for
> offloading audio, sensor, or other DSP-related workloads, and is not
> required here.

Which likely means, no compressed audio support?

-- 
With best wishes
Dmitry
