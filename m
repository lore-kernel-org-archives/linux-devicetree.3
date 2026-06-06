Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198483803F2
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780754461; cv=pass; b=pluQrBqICyf2ZSJV4LVTMrQvKOavQkMj8bgWey8ZtRp5TT3pL6Y+vr3J6qeVSZma+oS7jfiV1/dnxMh+U34arRQ04QCZhXP1FLAHqhYPDWE+bKG2tzeJjkeFF8hHtw2qWwQvdNg6cHguLKLaEbHU79Ht20ZVbs4ySaRNVZC1KX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780754461; c=relaxed/simple;
	bh=o/jLftLru5JwMQVXS/FUWMZA0RWydIgmyeSD5jsebN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PxHON/pFs7ivzohkHR9BwQ5Oe30jUHG5VXlSK4KGIdbScyTEaSoYvkpeU1+eZ2fWxHYMphIBI/SU1mjo3oPFIVK4CNhPqVqG1KDyvYzqJVfH1xUZ6ZZ3/osM6pIJFm3zYcRn7WLl01qkpOitvrl8lPmt4s6BNAaj3fcAO+RSjTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPXQSakS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dB428GKT; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPXQSakS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dB428GKT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGall1291028
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 14:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/jLftLru5JwMQVXS/FUWMZA0RWydIgmyeSD5jsebN8=; b=JPXQSakS+MvI+aNT
	LKrGinXT5XGqii/VdctQAPJbqKGrKAmGFy94cTaxXG8ZGWqyPgShYRI2ctVH6dh4
	Wr9hNoptjn6trp3EW3iVnQpsfwfpIVBcZkrxbFshMsEENdvKwRZBeSzGJE7gWS7q
	1xRM11t3SUXBeS7JjrIJOF7J+JDxgmmMah+sGptyb3JDIt8jcYaYC8dKWAPu+NHY
	wD3l8HZ1SeeGgGEseg5UlQCHGRzRyWZNuqRYESmUInq7D3PVQdLttSWi30Z3BhxU
	KaNYO1XaC3gVaySQWGBu8iixlBts/BjBlP8sWd6GoMSINCeX9lhHGU8TgvR88cme
	MHV3dg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmr99ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 14:00:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91572601753so593001485a.1
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 07:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780754458; cv=none;
        d=google.com; s=arc-20240605;
        b=KvzGUUDYKyPC6zduIcOEm3XCh4bWeXaSJpEWtuHjY0loW8LEFK5uHqryJRWDQbSsgb
         tq1p5TgKj7qbca1AJAQxz+BX+13r5aIwz/mBhpLHBTtE56h6Dr2L3fm4O+aASBOO3B9d
         W8Ba1mZdbVSqZ/JOX+8Rud6cJK0fWG9nnH1PxB3AGGr/Jxpfg9Z+tYayvhFRfgBVbrJ3
         /VKhvVHP9bhKqjppGDc+N9FZ/B/sFoTDLnDanMTrWf9bzW4X4RfxNO8aSbEXANEQALvN
         LBspzq/l5HoS2gmKE9fjSYB+QRHp2HzgzHe/OzPeuvkPWK5xuBdg9kUJ9hHy+ZzOZITc
         yzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o/jLftLru5JwMQVXS/FUWMZA0RWydIgmyeSD5jsebN8=;
        fh=u94LGAB0Z9ThTct1I0LU2dMCY+Pq7UI3YK0HQuArVEM=;
        b=JJ+UMsId0aNnqQHThZEQJUSTRkZCVDUzXtrP9113l49f0anD/q71Tx4gXVSG1gEf3t
         NgZ2MhftOSWw5ilXndnRnw8QgO9kCuM9IZ/aIjGcHyD6P0tu950cpAEoCnrhg/ord4Ue
         vuuiDkBgoel5aL5UW/UfPrsgIWUz3VU3isQCSwKTlhJEBWuLvcJKw3rQGnmVssjFH3TU
         ZSwmkPKNjDONXRFxnFLgKxta9PNKXwynSo4v94ucqtktvVLgtgqbkKzENNuMO5Ntl6Yd
         1ZmkYLvIub3NMfQ/0754Y/prbyyWT6PK6mPzGsd7PNGrXj7Gte5ud3JU/1mWxe+Ks8Ux
         1ciQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780754458; x=1781359258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/jLftLru5JwMQVXS/FUWMZA0RWydIgmyeSD5jsebN8=;
        b=dB428GKTjnfzgnzY0VdY5X88bA1M9nJkvHYyGnRru+Xs/JRPPWswVfJQWglw9dFen+
         pDDsTevpjBieyw2m+L2FxiMwln7arXxabsLvOSCQl42o0rX5BoPZFhZ7brrgDXItqHtp
         9yCNu9ru+bmflzLIfTcGS6Py0q88IDV0yqhFasAQTx+vsnIMboqnaePn3VDFJrt1GEwp
         a+k2H9MfDgQuDeKmK6FOBE77BqgoO2q5hu/bGEA7Vr0pTHGqX9p2Tcedvgj9S/USOmnp
         GeusOwx5MzG1rMwFhc5ITSzrpuHsuf9ICGDZTexJBlm9S7cjHOsavbO6OozGdCL2HmX8
         f7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780754458; x=1781359258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o/jLftLru5JwMQVXS/FUWMZA0RWydIgmyeSD5jsebN8=;
        b=W4IhLh5B7X4LzjOqFBVrkYOtWXJCGFBqpJO45StITnCYfkV4pdu82S2v/1nQGiZYUG
         UgUzTF/AoP1T7xVCpCc7wx9NDk4S0cpe54WekF/lxe56fSYXpCFi+PNh4keDwIQMXPCx
         94AVf20hvaDtlNxrc+kJCdYJIMhdE9/Ckiw38tBodDdBXq0or26BiEydd+EDom6bekMT
         1wgrHvcgOiqORpJ22MN2ZnUGrh0ufxagmh4oYA4BXNYL1DGv8R3TLUAQ7Xh5hWQV8nYE
         aNXcbPSg8u1mb9TE4SJdwfnt81Q3tQRMMVh0SxYfBAISUe+TyhQQzadn7Ty/k/VXgDS4
         l30w==
X-Forwarded-Encrypted: i=1; AFNElJ9sY9+YsqErHGGP9cni6zB3I+bUYGUxQtlbmenYXQCTled5OxxVtYtX8+bUk6OgyAp5Mvu6jWClmfNl@vger.kernel.org
X-Gm-Message-State: AOJu0YzLiA0ooVcPxmAIIesIfap2QNt4S3IEByQjR4KjMamib3RC8VsB
	OZT9YkgboOWuCL2gg3a+NN4K9lVVE3jcCoECab/mehIe2yZ1HKPxpp6Qh1NAp61m6YV21Ydy/+l
	IlsVmImv2dLeqNsE3YzZJy576zDrxKzfMCGcRYdF5VdsYc+69TnYopCgQavZVlKNpV1nY5J9Wu3
	tNhse4QOZQmxIzzBDJ40lDP+NeIdCfaqnhR/m1MN8=
X-Gm-Gg: Acq92OHQsMDs8xuBc81YkievmBcs0duqy+fUDswv1vQfu5LhhNWf3/ugsur2m1rFDDn
	AgLgWQsh3/R0kXgpOTW+GC15vJlF9UOplxddtMUYV3JvdXIyTf54LkndV1nVqfqmnKP5k+HxTbA
	qnCgoAJ2Uzut46aBpwMsiMVefMPQ6x2rt6+1joZbDzsqtRXhvuxDmxY/WN59NkZey4DxrXjfhjp
	zLjQha51HI/EaJWbwrNMor+qDwtesd/hZ0w3HLSuR6+BEi9TkjW39FWla2/foYevozeAPA1G4km
	RWFtyTWku25SR2t7rrCyKa+2FTz0Qlwq
X-Received: by 2002:a05:620a:31a3:b0:915:83e2:3b97 with SMTP id af79cd13be357-915a9e0d02dmr1382618985a.58.1780754452708;
        Sat, 06 Jun 2026 07:00:52 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:915:83e2:3b97 with SMTP id
 af79cd13be357-915a9e0d02dmr1382549385a.58.1780754448764; Sat, 06 Jun 2026
 07:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603015958.1242255-1-qian.zhang@oss.qualcomm.com>
In-Reply-To: <20260603015958.1242255-1-qian.zhang@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 6 Jun 2026 16:00:38 +0200
X-Gm-Features: AVVi8Cdwpucsdxek_NSdtKb2Kz8nMFR5OUfI0v7GrC-4SlIlGL5v02UFlRZ87y8
Message-ID: <CAFEp6-0XDjuCNy=Eac94VQC6uzumeTyYPy1CYtozrADpC5D5sA@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
To: Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDE0MiBTYWx0ZWRfX6Nkwt1LT/LjV
 ecFXVZkzb0K2ziAo/rJB7O7kEBm7fxDSMbnhDJ7v/eQvO8DnNbk/7iXfl+drEcZ7x/EK3aV2Vck
 mBTVjzcy8/zV4X4yq0WfugtpETJinNAYSqAUxuxqdeNGMCSkhb8q/dO6bq31Xo54AfJlDaEOZXH
 +dTNhWhaIekYVjBG/MVbac+F2CxbOO/bo/tkw2xwhIR3HWp1jk4DoCfrbGIkCjVI4d9Vxdxd+19
 HJKyoJ/iCDJJ4CXGFsOEahFcsNYiwDo1N/FxBYNgNQbojENMyXJvKoFRNTdT6HrjNP0j+bEQYv0
 JQfP1lrQbZsiprh7h7kmIdRxt9mIjsmdb3ZCzT6PlKTgRnP3ogKtr6zDTULdHFh1uOHibsKxsQo
 cxtwA0wSqkmHwxL6mXz8G8D/uOeKLBbOXznkxceESVS1Z6t1IrO8lUyEFXnxGR48Iknyvz5O+7J
 PoejZAMMvYA83qSpQBg==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a24281b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Tt4NY6GeduoLECNWj4gA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: tNVM6YZz7k-AuyRdbG7b28gvNGx9uRvT
X-Proofpoint-ORIG-GUID: tNVM6YZz7k-AuyRdbG7b28gvNGx9uRvT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060142

Hi Qian,

On Wed, Jun 3, 2026 at 4:00=E2=80=AFAM Qian Zhang <qian.zhang@oss.qualcomm.=
com> wrote:
>
> Add support for the QCNFA725B M.2 module (WCN6855-based)
> connected to PCIe0 on the Arduino VENTUNO Q board:

This overlaps with another series that relies on the pwrseq-pcie-m2
and M.2 connector bindings for Wifi/Bluetooth:
https://lore.kernel.org/all/20260520-monza-wireless-v1-0-9f6942310653@oss.q=
ualcomm.com/

Now that this connector is available, I think we should use it for
this kind of module.

Regards,
Loic
