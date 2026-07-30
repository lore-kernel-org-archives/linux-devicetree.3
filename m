Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7E531715F
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393492; cv=none; b=fZMn31VaJ5bOP3VPs1JKEHptFrc+YodOxC0DgZC+qm9E08uHXGuMy9kgObqTFAZFQgNrKCOW7e+d10tI4xZpoSKCeds3m46Gzks/I+Jwi4Pms/KRcxIp+o2ClLkxSlqR3yLfrbZAF1TiJbVJbjOkLDtnyx2zMq4P9E6Kxbcsqyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393492; c=relaxed/simple;
	bh=wdXk55i1ztdtGaEhq3W+GOdTkKjOpc1gc6SfSK0SaSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcJJV/phRqZveaybcEORm1IX1YvKks64pYJJVvcvLm5zzEmKS5Eb+AKFUi51a0jybX4vtvx2p3tiYevUAucKRTzqpVb4gbgxP8MqcCiwo6BAHzABRH0T0yKCbc/m7RKOVYEWG3p97i1O8V8lFtLEz6rz4wUIajGEMjwG4nxni5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRFLK9FZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+/RyJGl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRFLK9FZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+/RyJGl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6aTS34002721
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wdXk55i1ztdtGaEhq3W+GOdT
	kKjOpc1gc6SfSK0SaSE=; b=QRFLK9FZyJOYoqzg5Bw2cmrkRr/isrt3q9fTUpJN
	EoE6XcvVrpYrjnE4xh65qMYUUCgmZ8sANEPefgOmvl7DnSVh+OrrW72ITu1sHh+K
	+gvkYRQm9iOgapojTCYiR341Fb0vqeYr8Q6N5lS2r5kixZxJySFw7f5MZm9pYHCE
	Uje1bULEe9XrvfbZf/2wiJ86vICBTve2EP/9ZkBaDJmbJtZNQFF+qUYQzcqs1Oqz
	37JA4mrnoTFmmFxkwLw4gqL11sur2pKEGAAkbWby7eS8Erw+tLVD+eIfL7RS45/p
	imbzHgLk9YlvXfNNoowVV3kNz1SumN21sk8FSi+TAMVPeQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr17s82xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:38:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e6d253330so286931a91.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 23:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785393489; x=1785998289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdXk55i1ztdtGaEhq3W+GOdTkKjOpc1gc6SfSK0SaSE=;
        b=B+/RyJGl9OBS9R4Sbsa8kRwa3BgoQriOWgqO/DxvnR+3YmIKY8kH0/WUC9VLYUYA39
         0qgK6bXwaCUzU8jU/d1UF5y1VJnsLQw4sMrIXlsoXckPzCgbuZm3ATgk0cKDobuF9/4K
         I9Xi0SykGoTUir3jCOxq4Ifpq6lED/XrjglDBgr8EmLyjh9kkidgWaU+puNZPbBHSJI1
         qrT07G5dpaVZf61F+XQ3R9MUNkVEDpoiuLh4qYXSb9snQEZsjNGtLxSL5YdpoLba3A+w
         E57tjata52SjnuM3A2yW6NlYgfPoQP8J//djZ6fAw8nZnzJ45Q2c+htBK+UDhA1f7FwT
         nW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393489; x=1785998289;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdXk55i1ztdtGaEhq3W+GOdTkKjOpc1gc6SfSK0SaSE=;
        b=tZHq+/BG7ZzV5HMBKPGgZbwk3iOPXNMTb/6XMxTTiqV/ZcuqwjdlCHWzcycnBOFgbn
         mM3tYHLFJWKFu2vKvy8Dt1uXR5OTHcEwiQcOjVIntFxC7bARzxZuEJnwKiINJWxr8L0Y
         uTy1VA7qB4r3SUzEZTdAdzKMNhANSbGmR8D0h24FWd7tvLdegv3+aoshZNrHerLyE/aQ
         8fHjo8b6yAHkJmZ+VFd30CEChZNxKh4G1Jx0BEttARwcPDSDtsVryjdZigt4ZxSMM34Z
         qJC+xmczuHoSSayDstH2L1KGHlnMj0gdWYJVAYRy7rt1+RQ4JwPpmVySFNDl3NSZFG05
         EN0A==
X-Forwarded-Encrypted: i=1; AHgh+Rpcb2htQrq8i++9PqSt0L5qEeifCybVLGVDJ+W9IyC8agRpUx89qbsxleFYRJKVpkd/sKpeOWMrqDVq@vger.kernel.org
X-Gm-Message-State: AOJu0YzW3et76M+lLkAo7ogDUqa+FAni9ndCGojPVMH1/rKY/O3HY0kD
	ZdNfutMuegnwemaFsJEpVqVf1RAKOeOnfAtUEtmEGlI7ZgkKdbFRCYATLmeUNDvFYh7pGG4nXVN
	sJenbYqnJyPE06B1YpB19wYwXHF4L/72sz7mpjYzY9Yj1VUXBeBqYuJoXcbsS0Osp
X-Gm-Gg: AR+sD13IELmdWHdktWo7g2WyD35ZTS6uOMpMYNtWKxuzggxXx7dggp+wRlCHzS3Kurl
	60ih7ODXocyWwkIqiFOe0Na2oPtCodShkfi5hWQa+fTYLWZajSYnerHMCU77loXFlXA5oh4Xm/x
	skxbnam96BMLSEkq8Q37mkZ8uCGqA9V+7siNTgtcRC5hizI4GumBUaN1dwvCd4sbNKLzh99Es6t
	ODWwQjCdEz69I8tWj2gLsRYt1xKe8LiF1TG0dDR9DYMSH5BQyWqlixnh4QU9plpemjAngeKzOiP
	8Tbs7q7ldg1ZkZDBSOY1d32AWBWI90Blj6i1blGQDzuqZQk8inzcyOqGsLu7iHGGD7FiuNJ0KTi
	uIAcGNf+Giky4NUSUe11SQJgIrg93pE6bE2hDk29uvA9Yt5l9OK02B6+qq9Sb+3YXNTnMXFxG7f
	PmMXZ3dXUv4LtrTIc8Iw02DdgC0L3QaA==
X-Received: by 2002:a17:90a:e708:b0:38e:7e9b:5fbc with SMTP id 98e67ed59e1d1-38f9d3d488bmr1092700a91.7.1785393489550;
        Wed, 29 Jul 2026 23:38:09 -0700 (PDT)
X-Received: by 2002:a17:90a:e708:b0:38e:7e9b:5fbc with SMTP id 98e67ed59e1d1-38f9d3d488bmr1092672a91.7.1785393489061;
        Wed, 29 Jul 2026 23:38:09 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7271f0ddsm16725591c88.11.2026.07.29.23.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:38:08 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:08:02 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
Message-ID: <amrxShOJc+bT9pjE@hu-varada-blr.qualcomm.com>
References: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
 <20260724-08-dts-v4-2-65e61a1061f0@oss.qualcomm.com>
 <35b14c17-2953-4b74-af15-4677390aec9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35b14c17-2953-4b74-af15-4677390aec9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA0NSBTYWx0ZWRfX5SQmZRGnah8f
 gYUnSshbgbAF3bRNnHhqkLlQV2hmLpwCniv1D6cNCKDt/Md1NraYUYYBDFRsGBr0aR7m0tGAl/Y
 b9wKw+2Nf7imb8htLdoEP3KgjvZTvSfbfNTi3rc2M+mfelQ77tptnCQLsMrqcZE1YZlVlGJ0FzR
 3TW14Z/N6GvVwDupoPTeYfRpNCbL0mE2+X8nXeEM10euw2Nn6m0kSVjVmGO7dMS2ey37Hb2qO9l
 xcRP8MX9aEx4QXCv/gUwKdsndwiXafM7CQczZ30TV6E3X30N0lYniZtLLTeC1TqsMUlZdo2ymA6
 s/b83orUQVdutr4/HY+oLqIdRzzNhDQA7jCUk71kaDUn6HDiY5ljFwVdZpesB1OHwE9371+ALbO
 D1xIcPPWfJvaHu6ApIqLSTgr/iql53PI9hNhWpJx2PIp2nndaDIx2wu30buEwjMFsYvzxpfbAP8
 ZFtxuKO5Z8SjTTD34fw==
X-Proofpoint-GUID: XTuV7CURabCPWzJrnzWIinW86uUh181Z
X-Authority-Analysis: v=2.4 cv=M6x97Sws c=1 sm=1 tr=0 ts=6a6af152 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=TEurOFaeXT4H-FEqwasA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA0NSBTYWx0ZWRfX1LHHyFt/UY1X
 NG+Gc4JHaf8LMSiKkZN+diLipO/JLD7rySQpoR7YY0FUxpuFMToSuYVRs1xeTCiZED3bSJbWVOP
 q7VhA+yh+qaEAafxU1vr2HHtHycI+8w=
X-Proofpoint-ORIG-GUID: XTuV7CURabCPWzJrnzWIinW86uUh181Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300045

On Wed, Jul 29, 2026 at 02:10:56PM +0200, Konrad Dybcio wrote:
> On 7/24/26 11:54 AM, Varadarajan Narayanan wrote:
> > RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
> > share the GPIOs. The board has to be reworked to change from EMMC
> > to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
> > and include it in variant specific DTS file.
> >
> > Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
> > and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
> >
> > Remove ipq5210-rdp504.dtb from Makefile to avoid build break.
>
> You're essentially removing support for the board for this commit
> Instead, this commit could be:
>
> create .dtsi (90% of the current .dts)
> add #include .dtsi to .dts

Initially did that. In this the git rename of .dts to common.dtsi gets
lost. So did it in this round about way. Will do this and post a new
version.

Thanks
Varada

>
> and patch 3 could be:
>
> create another dts
>
> preferably then, all new additions would be done in patch 4 altering
> just the dtsi
>
> Konrad
