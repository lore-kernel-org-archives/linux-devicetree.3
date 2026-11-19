Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102247;
	b=wY2OvvF6IEatvTQcG7clxfq3Vs39IO2aZ1HoBZtWP49kE9PxCR+nZ2Z04v9i2opdZuk5
	 06fFTiVyVpjN839pWN/+vX1RM4bx51Cz0pWHPF6zSoTJAWhELKw3n3KKH6PDbe/SY4Z5d
	 6JlKEw1kddJ55qI312FV1nwXH/x605/RqHothE5vCvv5cK8seBiwxWW6/xdqFh/PBbJjV
	 RxWtph1XOaY2ADHvwPsvv95Hxi6Lh7sRFVrXnpxBuoohllE4igmJJUie4t3qisIJp9cES
	 o7Q4hgtD28EHMMPjiW7fiKw9CqPEyezypQlwOIuoN1CZCVItsxrFb9TAHg2Rr6nH74A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JDnpOn5OCiSx6f0pLbaz7y7dNDOSBAwzbbFSOhKoCsM=;
	b=lBK7XB7Arc76ae4XEMdIqZSlCqU9IDpgoOFs6f5HLohLE1bXHrwtDw47tRUhl6zOSUks
	 H4ido8TUiZ2QnRe0zNUXRPvhxYijQ6fDd02n2qlicXrltzh9nz4LsAREeYL4HOaXhYEHV
	 JWuEShr+ZlH1aBxWMs+XlG0ilmSARA+HgUWipKncaSuVpOjil21c5oPCrjZIE98YbXjFZ
	 Qn6FpCjfeR+n2crM4Ov6vqpcAH9BI9RcHTHxiqSDZtCFmgZuQvIxvZX+B8O58KWotUcvx
	 AIpNKMTQnUe2p/laTTJbMWVRytPpvWizX+N1aFX7CPhBMAboHpnaC78/Q6DB1n0QrHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdR0S3NP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djj2hMfo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEB1606A33E
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEEB1606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdR0S3NP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djj2hMfo
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJF6POn2773764
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JDnpOn5OCiSx6f0pLbaz7y7d
	NDOSBAwzbbFSOhKoCsM=; b=jdR0S3NP3CDw2weUvX+xbH+OzPbLEO+EoQtdhVMv
	fCqCk+8HQmsCRIB6pZV59ZHjFwvwx35kbo0A+FJGYN60TfB6JtZPDzDptfFPjF64
	tNbutxnk/dUFOtDtJFNePcT2NGY1kWGouZJgUomFy/D0NxIuabI4Vn4LfKEbGAvi
	f5WuCnfAKn+S6AayrKejqaDS2KCNDGcrBl+D3WxfSPh0ahKocX+pyL+inC+Labmk
	XIqQ5HbDSAJspyIKHw7RRAtZR9GYW46R5nyqgmqqiJq7TNNme5h7KZfMBhrbm3Lg
	jz6p74AxwuQ5nNoO2tj2oDp8rmBIlY8A9a5JwCLKVjEV+g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdcugv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:30:45 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaad8219b0so651637e0c.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795102245; x=1795707045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JDnpOn5OCiSx6f0pLbaz7y7dNDOSBAwzbbFSOhKoCsM=;
        b=djj2hMfoc+MAoyITPNWb9uoUa6mFaXQaZzyFAaB1YOumWQHY8ALSaA95RGQabh/Cle
         O5D0BtIfUsxdPlRwRM4yh4JKPHmbHWTxciS7q4O4H5XgOeAV/iTitBtkXCxfKSwOax40
         Kcr3pYFUDsk3K/E/Xs6efIM6793RlM682EJWNC2fEmn6k1zEbXAaSsJ0gWn/eAtwwRF5
         tHrgTHiaDiOs0/6mIeCkmVL6c3wecX8WCAZB+3JkM8+XuX5kX6jaSh0omYpMsz0rl82e
         6Tx0W+iRi5KMPKhLRHuTrtADohaegZvWvCknY/78nCleslqktu4voOAwrkHIeS9mNs47
         Lekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102245; x=1795707045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDnpOn5OCiSx6f0pLbaz7y7dNDOSBAwzbbFSOhKoCsM=;
        b=Ca9HNGxRVmm3fSnzcSQIg/S9FlmAlU3EyuYYB9zJwkcnPOKjrcMKgX0IJLg2uXm+T2
         iaLkZai56TaZj3ygAfhfbddfmzLzhTQr3406j0YBJK6zOZZu4vtjES4PE1aeGB058n9l
         wF99V8XE+QmY2qR6Hc0RnkhLtNlI3R2RUqKHSz/vvRfTUoShKodPEJMoc0zCTsf5ZMXy
         20qsQ2uLbZZJg4YGxejRf8yTn38Zi5Mx1CpdJn2XnVIg9t5Eb1K6FFVXuavRj2SHDqqA
         LDohS3KXxXKbRrbiyNLkmPoM2QC7XAxvQ7/uPT+W/rPvyOMkrH14gFgZ0GQS5NK7Yzp1
         h3sg==
X-Forwarded-Encrypted: i=1; AL+hErHHwEjsRf9pGqSLM5qdE7B9kqZN7l+JrzTKrE+4pK/CaQeaLDSWYjMU684SXJS0RDCCTFlMNIQfo123@vger.kernel.org
X-Gm-Message-State: APuU4Z9StLT7cofFy64eceeUdDp9N262BnwF5KVjJH3HGcPVMHMaqLax
	OAo1pz0TK9xqSHflRKNnoWsH1BQU/3ezbY+Fh3E651/LUyWe68asZ4eZn/zoqEnHFfXY0lgWJqh
	jTmyWI/HBRRF8+BC3ZYDESS560gAbmvb5RmaglVlzyhYFXpOao5aAu3wNWvrrnxH7
X-Gm-Gg: AYBFou0NihEMPIgmwXnbVkSF96ah6ZbUcFiJ8KsnZgGbl0G40PZHEIJFJRaCBLoZ4W4
	RhPcHslp2fUxx9S2I4tFGGO2uopj/phkRXm1+ScCc/7iuszVDLxRw1TSAMs6cuJmN8DDV3SnxIQ
	6XKfqiP6iBbcIs3H24rS/s07QBHoVj9bbQv86zlBlIpIhn3CJ9XnBRkjEdYFw0cq9EshnHrnxQv
	Xk3v7z/IrPFjNYpvLq+ib1pLLOWHissSbxgjebgcwk5TlWF9fP+BhMNrGoUyayJbjCBaIOOG3aG
	ye7yFOaGBpty6TO0ON1EKUmZP5LMVsVF3t+WGU7LE464vKC6Dj5eOouiCMsJEhmSL+M5g6G5CJF
	3BDT3A6tKZ+l2n8jb7183c80rTpv7JcdgizkVfiqCdbgIUGxkyJgnFsmF/wv6vykyPdcR23zrfC
	5B705MgNr9aRc=
X-Received: by 2002:a05:6122:e243:b0:5ea:de2e:545f with SMTP id 71dfb90a1353d-5ee8aea6c15mr5878e0c.8.1795102244775;
        Thu, 19 Nov 2026 07:30:44 -0800 (PST)
X-Received: by 2002:a05:6122:e243:b0:5ea:de2e:545f with SMTP id 71dfb90a1353d-5ee8aea6c15mr5775e0c.8.1795102244005;
        Thu, 19 Nov 2026 07:30:44 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e06c73sm75672515e9.2.2026.11.19.07.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:30:43 -0800 (PST)
Date: Thu, 19 Nov 2026 16:30:41 +0100
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Fix GPI DMA wiring of QUP SPI
 engines
Message-ID: <av8WIZjPgnS8qWNt@QCOM-aGQu4IUr3Y.na.qualcomm.com>
References: <20261118112407.103412-1-shengchao.guo@oss.qualcomm.com>
 <5poepxkppbiyfxz2dxkjm7p7xiq4ndoltsnnbqlp5rdasbvrxr@p2ocx5b3kubj>
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
In-Reply-To: <5poepxkppbiyfxz2dxkjm7p7xiq4ndoltsnnbqlp5rdasbvrxr@p2ocx5b3kubj>
X-Proofpoint-ORIG-GUID: gkJUHIRz2E9walg2t8YtGFtxd58kvRwk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2MSBTYWx0ZWRfX/4xtks/BZUSq
 L5HVz46xejOD74jIMNLUKUYq7DAZa5SDvjWSOcEr5SvEDiMOgL8kGw+6ZQQEvEzZE2RRANbm+7j
 3GJTQVAoXoLbPsjKWe+d7nVTSZ9Kfms=
X-Proofpoint-GUID: gkJUHIRz2E9walg2t8YtGFtxd58kvRwk
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6aff1625 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bQRtwVpyhJfczlGs_sgA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2MSBTYWx0ZWRfX5NAopxHh+7qv
 uFVvRBG9hwn8nyFaq1hNI/5jb1aBc7T6s1AzuzZhxTeQB5BNQGGHVaFC4dCtFefDgOxc0onVnew
 DFbN3ge1m3BZJDlGcLgiMm53AAVuQs54YXjuQp8ECUB2yiXyzxs2KBUuNGsggOd+WR0uXi7Kkhm
 vHRtJr14ckcjZ3USBCGkzJ7DIiiACdR/RguTCvgXFxh4nn/taMx1BRbedian8mY5HGB268hMoSG
 ToP1bkV0pLqBCVFPl6/OEzLkSM/lKXr+Xl1SluCAonLjF+YeJaK09bJp2XgynHosv+0Z2Ky7saF
 bDYvbmNjFon4XqCVNyzbpA8qoJYexRZutnYVEZ+/PiKNBk9nqUkEiDKwNbQLOQGhRtAYV9TMuk7
 1pIiPsYG/VRs9qidDsxnHriPiUgtuZlnColGj8EPdxmJNhaGFaHxDVuX6GIeE5l0WbNjaGILBXO
 fVxAzGeTKirIfK3SLTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190061

On Thu, Nov 19, 2026 at 03:04:11PM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 18, 2026 at 12:24:07PM +0100, Shawn Guo wrote:
> > Commit d8005dd04efc ("arm64: dts: qcom: nord: wire up GPI DMA for QUP
> > I2C/SPI engines") put the QCOM_GPI_SPI channels of SE 0-3, 7, 8, 11
> > and 12 into the uartN nodes instead of their spiN siblings, and left
> > spi4 and spi14..spi19 without any. The UART nodes now carry dmas
> > properties the GENI UART binding doesn't allow, and 15 of 18 SPI
> > engines can't use GPI DMA.
> > 
> > Move the channels from the UART nodes to the SPI nodes, and add the
> > missing ones for spi4 and spi14..spi19.
> > 
> > Fixes: d8005dd04efc ("arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines")
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> Eek! Thanks. I think the comment from sashiko needs to be addresed
> though.

I think sashiko got confused, no?

Shawn
