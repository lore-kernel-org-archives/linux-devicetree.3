Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B42B33A9C1
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029123; cv=none; b=UMK74Nc1yAaoe14ufFgjiBgYhLtEEW5mCqL2DeSMwOGyCbqa6XKFCoSLKIchZHYN44f5cNN9RdLTdk2Bahxy3Gi7HARr46iLmJolap5F+1jL4rlL7gkp0deVAfU3yat1ULH9R9rc/sqHlMHr3hat/aZsLt2hKYJ/zkR1ZpbwkVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029123; c=relaxed/simple;
	bh=lwX/AcC31+KPFnWCyHth3KD7fowt3namwKNEVOl1Vn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMOvdtDil/ebLbs5/SuPsJJQGaAcvCISSfXM6dfRtU8zcaGjhohC6xmRS109JpXaslBAMncg51gWvXS34ecqZMs1DLutaykin8v/PyOOLKn3RxYkgTGFpofgbDLixE+KIGzoGQh+eNKklsG2vLUhWQVVlo7jqYJiLSOT/QFXqNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXn/3+NL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H1m35FVI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXn/3+NL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H1m35FVI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A71Cnp754346
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ew2fbITH4ITQZ33o/4qHtXX7KyJnGn5+AQkkcoehl40=; b=XXn/3+NL+Al54R1T
	xFD93jU67LUEAqJRz6dakfpx32V+YS8ViAuWkg8hPaNoClETO4gTFr4etCk90tsz
	cOVMTGuoUJENtpSCgfGQbP/iDM/Njw/lzziWR4ox/MEBpTAkEBxmZ37Y3zsJwVlH
	yg6y4WPdxWwDGn40Ay4NAxLMdtcbxnDM3+p+JfibZvl7XUODNpSrdTTPSR52b1Mx
	LFiPJB58khxEUzBvZ8STmT/C2ERtuB1YvoF8ozhgNDKktbT/ZakVVKSyvXPGvale
	bbu+px6wgXHcLHDH0JW3cuh0ozcxTGBZefFx0MLy/jcc6yqhYr67FlkoqHY1ZcMe
	J/fFdw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvrb6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:32:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so1558942a91.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 01:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789029120; x=1789633920; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ew2fbITH4ITQZ33o/4qHtXX7KyJnGn5+AQkkcoehl40=;
        b=H1m35FVISwwNcB1nQRAMh/1fQ8DqS1VJZXtyrW7/L79P+VwYZQjNXJ0EjDYtB8q82b
         Tycsr/WtjPR9LYzdgL1HdKKmrSErvo79Uh/jbRepjURBV/MUCStMF811Yx+j9kBxcoMb
         9wLbVEvDlmMSrm/3V1GFV8tlu0+q4WgtlvZ0EQEsqBXFoUL4v49u3kgnqVT0FshKVMV8
         fRw6vx3yXhcG+Ng0FDYgtLx8lA0RWRNZOP3ak3bO0SKJZ76M1c4yAS6FRbVGIix3m0l1
         uzzAiWwocg5m1k7IfW60yc/Xv3hj1arQPxe0c4fkgOr1kk5iwa9nE8xZl6RIpqOX07ZK
         Rbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029120; x=1789633920;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ew2fbITH4ITQZ33o/4qHtXX7KyJnGn5+AQkkcoehl40=;
        b=Du+s37dKiUXcy5xRo3McWenvqtF+WFUDW8b5mGnczRISWrM3x7Dh/SwM8fDTkJvTBl
         1cjWlZ+JAbcQP+5CowsrJP2+4+X93PgU+fPTLX/qCEI7DbvmFNq7SSRHuU2aUDRi6gcr
         NAFZTgRMpQmUGB8sDFInlMsFz6UoctU5S2WxPP12E961Ijk8gEajJri/dCuEQVCFghPG
         60pkcXx6IrvmnF5CUOLglYkhHHJrq96ciBB1gSUUbWitaIQDnlQi8Fh11frcuh2yBe0C
         X6qBFTG1EfHpm9fpgOZaQnADiU9wKmh4UBLAnbgGKGQ5e9BHrU3IPolWNZ3iw9wwRgSR
         PFcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzjrOSkPowYdkdbxSUZxNjKNY2q5OW1fnx0m4Zvfjok5sug578Tg5M/Z4Bl4kP4ImhvTQx2WBm6pKS@vger.kernel.org
X-Gm-Message-State: AFuF++lC+Nd6nioYaT7xsF18/MkQWtflxSmyVAivInuEmgdjurfds3VJ
	XsUwWzW+FQY24md9Mf9fNPwEHD5bwun19ib14sLvuXDzm5RDSSNB679tbSWauw8QTBkzn5P/Ul5
	CMpoKYz+tPGEPsnISsinRcKbbtSTOKKDQZzKiYL1kVckshDAJZHnk4Sfy/yNF5+za
X-Gm-Gg: AYBFou1N/yFzsvMLu2r6j+wEms8fO5cp2E0q9LfDjU6kR1SYMHsVTCevj0b3naZOwjJ
	o1qvLg2Clnk/mkEx/q/UfxDj6gc87QONFVMBx77wxvctg6ffCoCNVJiD5L+tBNRvAzYyL3nutUR
	VWfCqPPdUvpAi9N6ZBffykKeGODgskJF6XxbjhoBpZFlz6mrFOIBD3b4o+WEufLxM148bHlQpPR
	Lm5wbyk1ivsGWfMl2qx8B+oZyE+PM71WsLjTn0j9oEOENmyPcO8SwAevIN+2UoQY2uCNakcuE8I
	a8lZQWKTLrEd8/TmpMebqM0m2RVDN7B9pbhweQCgTI+Fm84jrzqpVUllox06XK9sMs6nFzo/r6G
	VLa25a1IqeGQ8afON+7/SWa79wyM=
X-Received: by 2002:a17:90b:1d51:b0:39b:3b03:8a32 with SMTP id 98e67ed59e1d1-39d77bf643bmr3714027a91.29.1789029119964;
        Thu, 10 Sep 2026 01:31:59 -0700 (PDT)
X-Received: by 2002:a17:90b:1d51:b0:39b:3b03:8a32 with SMTP id 98e67ed59e1d1-39d77bf643bmr3713957a91.29.1789029119331;
        Thu, 10 Sep 2026 01:31:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm67133142c88.2.2026.09.10.01.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:31:58 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:01:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260910083152.k7adkrtodrc4vxz6@hu-mojha-hyd.qualcomm.com>
References: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
 <20260713160754.1250988-3-mukesh.ojha@oss.qualcomm.com>
 <CAGptzHOWVAvzp8QXXnjfJ=Z9Hkfqh9ekpcZbPxm7CdMSkR1kWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGptzHOWVAvzp8QXXnjfJ=Z9Hkfqh9ekpcZbPxm7CdMSkR1kWg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa26b01 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=xJ1-6qcDKzqjCoSX3XEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5NSBTYWx0ZWRfX9Vq2Qs9Zz38m
 Y9vUZa2pUoF9PgqN/qYy5Zmftk4R9HEmoVtqv6ipwO9+wj+Bg/YKOI+BlWroLJBfrLpmIyNlTmV
 dvyvVUQTfB9Hs+mJLauL5zuXDQ5K183xIf1j6cfYQ8WZ7UAsmRxBkH4SdyuzL41yn0LKuuS49vP
 c5K/Qdv6BIcKtQVWBBDoW4PKzWfx9m/1/QoNEYCZKhct1czDc5CvSAwTKumSNiPHYts9MAg5v+D
 9GAXlgwUc6VrxixOrfbTyxsRvwRRL3xdnLB4NuGskOe3FTLP3VLyy+IfAnrgM0mL8mzlaEipLFW
 uGven/jd3MHKWOAgS5fOAanklTPhubjbX3cCOuUBUIOtEmTB/YYDQOpk+ycpDaXr5LzjIwL9ehu
 Mj7JA3d4G9FuCVR2fnm2GGOQK/NOmiHFoETjWjuWqftBdZXsdg1Tqo6fllEzxx828Y9l9zpvPi/
 lJ2u0Ffj/U99iXWpINg==
X-Proofpoint-ORIG-GUID: CoohvU_LtON3f_OZ4QOPhAu4ORCBvpX1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5NSBTYWx0ZWRfXwgFxaEdo+0q5
 BDijstOYiVJSYYyaOuGIThm5zlX1ZjVmfSlwYc7pw7EWqWBkyNc2yfNtiE1VCUtjX5Bh7jS5WhW
 rC1Tdx+3oJERcUKf1oovHdxR88dCFx4=
X-Proofpoint-GUID: CoohvU_LtON3f_OZ4QOPhAu4ORCBvpX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100095

On Thu, Sep 10, 2026 at 12:41:11PM +0530, Sumit Garg wrote:
> Hey Folks,
> 
> On Mon, Jul 13, 2026 at 9:38 PM Mukesh Ojha
> <mukesh.ojha@oss.qualcomm.com> wrote:
> >
> > All existing Kodiak board variants run the Gunyah hypervisor, which
> > means Linux can only boot at EL1 on those devices. It is possible to
> > boot Linux at EL2 on these devices [1].
> >
> > When running under Gunyah, remote processor firmware IOMMU streams are
> > controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
> > Linux running at EL2. Describe the firmware streams for each
> > remote processor in an EL2 overlay.
> >
> > Add an EL2-specific DT overlay and apply it to Kodiak IoT variant
> > devices to produce a -el2.dtb alongside the standard dtb. Modem and
> > media subsystems are not yet supported due to missing dependencies.
> > The GPU zap shader is disabled. In EL2 mode the kernel owns the
> > hardware watchdog, so it is enabled here. The wifi-firmware child
> > node describes the IOMMU stream for the WCN6750 firmware; the &wifi
> > node itself is left untouched so that platforms without WiFi are
> > unaffected by the overlay.
> >
> > [1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> >
> > Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++
> >  arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 39 ++++++++++++++++++++++++
> >  2 files changed, 51 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> >
> 
> Any updates on this patch if this can be picked up for the next merge window?

Latest revision is v11
https://lore.kernel.org/lkml/20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com/


-- 
-Mukesh Ojha
