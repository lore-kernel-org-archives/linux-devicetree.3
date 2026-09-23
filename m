Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED84471421
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153898; cv=pass; b=kjT/4gFN9pguqrTAvgvRiE1/m0kCvhgt+uUl1wie0NSoWYEK8JSLwnvVYc38ZUezjRbbZGh/gCQ1VU06kNDPwZMUBwdKtzcURZxfhQMLtfSt9HqDvGxPGVFTBFALLWEtJAUwPyPsctPVXgUcZLCfkFmQcEL1KesS/pwCOHoecOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153898; c=relaxed/simple;
	bh=DEdHFyUqhIHwdMf7dFxUJr1GC4MxdyoPmBAlHWHF1Jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ndd6uQbtTwQkZhsLrwJZW+1idRH0k8DnPnxnaBbSpNxYl4v/QsdmNowCO7gQsfy0lxdL+d6y+lshe2ZI9vUczxLElOWWiHdERAy12U3pUf96yxBSNU5YXTwlJwervfdoMd5uNKcz+K9gvuAxWjh+mhT2cAg268jAzR8pLIiBhYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAgNDQsg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zups68E3; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAgNDQsg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zups68E3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8Jbai2028414
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jGJIzHbkPr61IxzpcTeecbeYKPhxsPUWAwF7/vDMLfo=; b=nAgNDQsgCam1E9vo
	/wdMED5YTAXYJuHQlykJJd6Y9Zeo9xU6nHLShLzRpnnoAn5lNOmob2t5y/nd+aLR
	LhLWnsMc7HtDQsKsfmdI86bFaNm0JY/NWXMS3VzayZfrJcrmBz+hbkyV8tTDj9oc
	GOiYCUg+g/dzGEpWQP/xHWMI7HjwOc0cfEufmHPWHLdqYva39mRP970AxXbVI84c
	tbr1WEzgoMYp0STCjhh92fR1/IeLPvxX5vFfy1wSULPPO98LBGtqKSIhNwxlrRP+
	refRGJXR16kNqtATzvqHci/H/vqrZL0B8hS4jjRFXq2Gi6UuEhBMTaEMA1TjcPwt
	6Z88Ug==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c352k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:58:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so1697258a91.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790153894; cv=none;
        d=google.com; s=arc-20260327;
        b=lZsfnFx6+1ipeoucadqzUXBMqpbHuRbqxctUNF+321B1WzJiHifZpSJOzsX6ZssHVg
         Bo9XxsYjWooengZKjsooKS2Kiczfu0v5UDLxZJVFiznYYrTPNpqVK11zXGI06ibBn+7k
         SOSXvgZb8kIZs+2TQfwzTgXMM7vND/eUVIlm+2c6YMeqwwbJcIf6K41aVp7ESiu3vP2Z
         ZUNndiROtio+TQdDp3JvKZxxVT7qWboMZ5ZypSFNsIdNBGCeaLyM2fSi/FloUgwQ5pj7
         kg34ledkedZCxMNS2IE0EyIDpdzcpBU8HyH/BjesdjYINRLh6VyAX13bn+Nwn5WArgkW
         bq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jGJIzHbkPr61IxzpcTeecbeYKPhxsPUWAwF7/vDMLfo=;
        fh=mvpUP7R2LajfbSzKkl+l9faRtfgofZS/962BZo8tOeU=;
        b=USarkazo84DW4k8z+n1ftKzH7OuM+NAbzxv11fS3I3TpfzvnvtFyz/DMAZxuMFWfQV
         JkliLJwze34j5Fm0dKKLsbuHMTj89Ry95sF6lQc/BEFEh2BaYYG7H0N8HLOvamexcBcz
         cjlX5b1pzZgQI7sSTHgSC6OvWc5MnwbmvwKwRgwgXROScMpvmrmIuHSWc33wJyP41mia
         7WlwGj3SAJWCZsKb+pdfS/lWV3jBcU4a4s49Xczs/IWJNtwLc25n1vYJBxwQ/BXjbPDF
         nnrzLrtMfWiBcU7OAtziBRHEUr76YLJEVZjcfD1kF1wJz0eTVcy8IiQbOgP/meqIEBy+
         HnqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790153894; x=1790758694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jGJIzHbkPr61IxzpcTeecbeYKPhxsPUWAwF7/vDMLfo=;
        b=Zups68E3q1jNyjytFGssUhDuSHLhbe0gUKxrmlCgaucYE4iLzmdhed+HlxSvnPfdx5
         Sz4W/W7n0asjV2oS8I+0+iZVXrosUzSCOaLHAEpvy6nWfxlMEmbo7BOqZJ8rEsNZKDr1
         ZPB8zQm6+G2Islbc6ZnrzxNj+A7iBWEVz0Qx9+Visk9ocCpZWPSk8uPknsPlf3N8ySJ/
         Iy7dSfXgCf0ELasUKtUyXu+om8hcYfEylY+Kx18GxVfsrT41r8TMfrKpSHaGY2SW7nYR
         I5N2qBDlMGSGdPL00YDWIZFJO/QY7SBg+WhXVC/ZJDy0esBILEp1Ty7vYCSKUQcgEJS6
         W62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153894; x=1790758694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGJIzHbkPr61IxzpcTeecbeYKPhxsPUWAwF7/vDMLfo=;
        b=NJnT/y6v7K+AL+7HahcA7FsPDCf20262n4o6mHM5ECkJblf51vrnyfyJO7xeinHJoL
         or1ojGJF2MaIVdmTLVst5lpHK7zc/+VG0btqRk+imdW5nukjEfixdZim9Al7lDpi26oI
         ApooeU4+ZUtKOvyN+IT6dZEAz7Dz9jeNKKcAvpAjvOYrF70oTwfJ8bNbR8ftDGiaYUEb
         0Cq+cb2z9pam3lERu2iNm99SH/hoX7clSMOCfvRXrnjuo3XmSaF+U0LrOGmmLYzQwbq3
         MNKcnALM5TDPb3mKXDHyRhowTn0ItszFsaZ11tmUp69S7WHVUEX5QwCDqsZUr/eytv+2
         o0og==
X-Forwarded-Encrypted: i=1; AKwUvBx0Qp0avwv116h8cbrTQ160qRcQh65+pkCxMedPVkPwQUdOiLiJK+r+1TfdKWrRHPBy806vIswQzvh/@vger.kernel.org
X-Gm-Message-State: AFuF++ltCabY1qF2bRjlDUaFAJ69dWYxUShZc1e/4vE9V+fT/wKEMMXe
	Hh3IzBJzmTBM8848wHxOPTvTYcHwCwtxzdj+tNf+EExVzFdYyfH212Oblbzb0TK3I0XFmk9jf8D
	MfvyOuPkaNyuxRIiqstkgarZp4fuFgKDogpDVgypHFV3v4lIwYldlggRKnFpKfP3Ko+vvsNRaug
	Sm7jKmMpmFRu6qm6suIpDutiQNslB39t8OTxyGtpA=
X-Gm-Gg: AYBFou0q/fra1nZS2l1ky5vF83TwDBe8VhCzv/cJLODA7O7dVO7SVEOzzAU36hpnyLi
	93ByE42rMhXJDJp1DnH6cKPuvg8F1779L8c7bJ/fq4RHr3AMHUzq38NgyRlrTUC/fucnuxmsFOr
	yXkPIjOIPbTihlDIyPk+evo2IseYlUjveBIfZfVKDz+YMKBLZaKx2sIAWueg==
X-Received: by 2002:a17:903:1a86:b0:2df:5a5b:5763 with SMTP id d9443c01a7336-2df69d1ae2cmr17991735ad.10.1790153894447;
        Wed, 23 Sep 2026 01:58:14 -0700 (PDT)
X-Received: by 2002:a17:903:1a86:b0:2df:5a5b:5763 with SMTP id
 d9443c01a7336-2df69d1ae2cmr17991615ad.10.1790153893999; Wed, 23 Sep 2026
 01:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
In-Reply-To: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:58:03 +0800
X-Gm-Features: AcwNN1UZNW0WwmsWNc-3C7OHdDr5-ws6w2MX2XvUgjm7pentkYd7E7-hxDcU_-k
Message-ID: <CAFkd8hvoUi3dyff8w72pmRHce0XDNUepCsR=1gtimFMgA6gmBQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] phy: qcom: sgmii-eth: add Nord USXGMII support
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ujT0lCXIYgfmbHQmnbkaOixXRHvD2AvQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX8lJb4ZRnCd+I
 QrBSwRR6XeVEX1KzyDD7cZQN9Yyiig7tYUd4/ONKkpmKykmrnHnyzTiwgBdS2RBRjqndAJTgGU5
 OQS4jIqkBqPbX6chZoPzfEKE0wM1SXU=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab394a7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=mh0Q8UrwBuG3fYCamwUA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ujT0lCXIYgfmbHQmnbkaOixXRHvD2AvQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX0RIJ0PxmFUvR
 reo9/J9bMPFYQb4uoI/Dt1nRDuY680TrmN/rVFwBPtP2OtnI7/DErX9yENu8W0etycexdGyUuyT
 P8AaQxiH1UYKguvvDI26bht9F7b1mGnzi+P4h292Yv8tSRpzLxAJaDZ7L/zF00q3LxLBLyVWFkW
 8Lo9169IL5o/TWpR8AWVAqPwj0dIOVyBdgCDwMqKQb7yFBnC+GIVwI6XQaI+swGDWn3DDTEPaf0
 cUqp3WaXcNtKmiL/doBGfYLo4qK6u5DF895H5dtLOi2LF0IBsedCXvI8jDLSbfzT88y7656GZ4I
 4sjV2C02Dyi+XYgOpLL0BBxidgATkjjMIP/NISXq7PkhQ+WwCrK1NIXbH2zjXVCzh/RAiDK5/fO
 Z/5TTnazXLrH9nTkNXDhp86QXcgv/+sAcjuBHxZpgoWx6JaABR3YcTlDvkHsu0JtFubmY94uCXc
 0NUaVQh8570EgLSfUlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035

On Wed, Sep 23, 2026 at 8:04=E2=80=AFAM Mohd Ayaan Anwar
<mohd.anwar@oss.qualcomm.com> wrote:
>
> This series adds support for the Ethernet SerDes found on the Qualcomm
> Nord SoC.
>
> Nord uses a QMP v7 SerDes block, which is an updated version of the
> SGMII SerDes PHY IP already handled by phy-qcom-sgmii-eth. The driver
> currently supports the 1.25 Gbaud and 3.125 Gbaud configurations used by
> SGMII, 1000BASE-X and 2500BASE-X. Nord additionally requires the SerDes
> to operate at 10.3125 Gbaud for its 10 Gigabit Ethernet interfaces.
>
> The series can be broadly divided into three parts:
>
>   1. Add the qcom,nord-dwmac-sgmii-phy compatible to the binding.
>   2. Prepare the driver for PHY modes which require different SerDes
>      programming and readiness checks. Existing SA8775P behaviour is
>      unchanged.
>   3. Add the QMP v7 register definitions, 10.3125 Gbaud programming
>      sequence and readiness checks required for USXGMII and 10GBASE-R.
>
> The changes have been tested on the Nord Ride SX platform, which has a
> MV-Q6223 switch, running in fixed link USXGMII 10G mode.
>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
> Mohd Ayaan Anwar (3):
>       dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add Nord compatible
>       phy: qcom: sgmii-eth: prepare for additional PHY modes
>       phy: qcom: sgmii-eth: add Nord USXGMII support
>
>  .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml |   1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h      |   5 +
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h |   2 +
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   9 +
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 226 +++++++++++++++=
+++---
>  5 files changed, 219 insertions(+), 24 deletions(-)
> ---
> base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
> change-id: 20260923-nord_ethernet_serdes-c486f715f383
>
> Best regards,
> --
> Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>

Good Job=EF=BC=8C

Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>

Tested on both IQ10 RRD and Ride

Full test patch is in the git
https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23
