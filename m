Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201058;
	b=GKdx/YEdrlpp5X+aRDQkah90KOvNiKdkcvRqmMoOirMNgWsNweFEuXBz7mn5Vpg/wEIc
	 V1e2nlAcjjgH2UO2JQPWpXGnKoEG+xxei8M9jzPYPVWE6h/GB4QAQWVcWNJRp7t20Lysp
	 00kjKz0QrMoc4Aoq7Sa9vkZd2ZgI9BwaWP1FXLilt4vEzLwFEsn8ZwVMXeHKsIV7sZbUR
	 NgmHAcnkgBdVYdGXEQvphW+txkpf1Yxc1Q1EgprHO4GOd7SZIs9SjHjibXIvhfJGtkW9m
	 q5ddzzQp4ihy0EwjIKbBBYNnDXrD9TrDVfZ9WYwDuT2wo9BlkDLBGybfcKLJacATO3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o+skqlyXi5KXpeKCusnyGNYLBwDyHqAI99UWoGRFSrY=;
	b=MpZB3uHtoPADFI1FMgeo152/C1hckq+7v5Vvb4VK2MqR3k3fAqtvU+twgfBSYsidUlLl
	 xnCj7zoioJ6Nd16NIS/9Q0EibhBvnj/gLuAKhzi61KbVAMhM2fMDIB8jlNImx3Cmzyn59
	 rORJBK6l25txgZm9URe2mr11JcJHorp9H/S0+sj2jtXsPJ/kkhVXiTrRU2ktcH/llXvGL
	 aCpwStrhT/t+JyQ2pXeROju3gopZ1V+7Yo+QBNwMypOyIKOowbGuhcLYSBdG0kWAbEeNS
	 m7lJopSzEaYB6V3VvrNafUDaDVQIREw3JGfssKYcmn37NSmxDwEamOOgsK6sNsN882w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=khin68Hf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJgkMfik;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD142606A31F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD142606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=khin68Hf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJgkMfik
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA5TV1471889
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o+skqlyXi5KXpeKCusnyGNYL
	BwDyHqAI99UWoGRFSrY=; b=khin68Hf4FSigvAPJXoQdZyBQsC5NwXBK2xXMffe
	7Le78ceeacrTdHJ/4mOUdZUtg/yf2p0mLwS+ax77lI+6FKTuEK6ubEbHyvOIArv7
	EoS9XEx9AWiPj296hs3yiJGY4hKOKDjpBrWzJQGf2ufnc8Rm7zdpFPu6z4vhlEF2
	vyZ5MOToHwHDZPLbmhJFSlPBxLSyaPOjStBzHR9tUDuHtxHVexFix4iEHv+Qku3M
	88iNfterTQK2dRTClSZ8359btgLHFpgjSkoyiuXAoWRR1LtqXMdKI4LiseJYpqbg
	zKscRMAxvAQ2X9jAt3OwjaTDZsygHLsD2yGE6dWBFOf1+A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehh4w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:24:16 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eaab6fa0f0so1228424e0c.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201056; x=1793805856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o+skqlyXi5KXpeKCusnyGNYLBwDyHqAI99UWoGRFSrY=;
        b=TJgkMfikJIEHw/1JFdGuQNVr7Ae5xVSLAAoKYpF0gTi1QgEelxHmPL2U3ykeOjaCyU
         dpwNdwqDnLRrsAoJVZPYJJJYKCvkeLXsglK5uW6jawCocdDYcfzLPO7rH8invqurdknn
         i2YZNIPEqKELuzWpncepKS7Xx+gJ2LX5K9HUTulLE69cvMCsdcx7bj3cozAqHi0/i0Ee
         Ml+BKu07iauj/EEbrVBtEXBESY/ZLldzEIZmbKwLoxJDNmvuHm6HKFOj8zmTeuQ/A7ts
         4eQRfNkCU7YYRQIM7rRlTD1jeCPXJgxblxTua14NfGL+iQCsjusOq+QxiJ/lR8cN9qXw
         wzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201056; x=1793805856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+skqlyXi5KXpeKCusnyGNYLBwDyHqAI99UWoGRFSrY=;
        b=jyP6sQpyk+K0aTcoKvYXSAmzDOdpFHgGK41HBRyUvbxhNuKoLVSzi/TTRre8hrMhIK
         zeBTrm3p+w+uPn3GbCP7A/tBK2ecuctEfZ4xGdFZpYj///azfpZ6xWXHnUTmQMTZ9csy
         6XCAm+ahqWuecFtacMUCgi5svTY24LmdGfT7ed9sRcysb+NeOoddukNDr3KmGF64dNlu
         BH5j6UbN7XMdVZUNYtO1dnMpSncSUm8GW78vt++RqXKhWSdrVRexjxn/1xqB37CA5hZm
         yRsOO+rnaZI5KQ7ZSXso6qkgysF3ydM9Wcz9fjJlDWtbjoHWsXJp1r7u6hIpYuLrO6G0
         1Yvw==
X-Forwarded-Encrypted: i=1; AKwUvBwpGxanWr/fJXPQs6qHTcAxSElkUcNef4Ku+tIZMS6kfSd1l7Gu4qnSGtQ1Z1oxbB7WTmiGCPHjVVR+@vger.kernel.org
X-Gm-Message-State: AFq9FYLfAJJc+/RsZKMIseB+zkevz+vVE1bHbHfB07B/bA27mafAHLIP
	voHw6hpsW4Xw5liGbM0j/Gx3u3pf42zwua4I06hQKlqy69dk+2ZMpLVY05NDFiYze53ziw2voKf
	jknBrUKy9mxN4U9gXIxBJDrMN3rMrqiRjjpBHvVYyDMCM85bg6jm12SWSjoa2VdEg
X-Gm-Gg: AYBFou3X1R6Dyyx2N0KkhQBLEidNXu/8mzbjj4LL6gx1uC3YIRsMhmEQrAY3w5CRpDi
	goXYDt3xmACppX/N3GNWF7jcsVCIaVs+BUDP90cSREhGgVGL41XIkMUyd5YOmQDOKaK+18HvhHo
	7Vds2veiQbQ5R6CdhMBTt0fzbxy2qeh/fBoYBx0Uj5KZ+0NdgikMTQIC/2PWvbLAjTgiSUbLxdI
	3N0JimPERUmMxONKkaHCStVQfjz3BIt/eDLAAktBNejEZSXBjcVLh2NTsdrSPJ63T4d2E8Pg2PI
	DsM1bKjokBlFR5Gz33xPcf3Ev/YwUj2nKOwGkzwU6avLyp0hsCGnH48nvIjVQg+0HOcqfjWM+ZQ
	to9ba4tchDQg4sBT/fPtvwc4russJr0zw7ELVv6ien6yrs25S+DSd9RwUgimSZKc1KQ==
X-Received: by 2002:a05:6122:4b08:b0:5ea:c874:6c4 with SMTP id 71dfb90a1353d-5ec4cc46813mr1425388e0c.16.1793201055823;
        Wed, 28 Oct 2026 08:24:15 -0700 (PDT)
X-Received: by 2002:a05:6122:4b08:b0:5ea:c874:6c4 with SMTP id 71dfb90a1353d-5ec4cc46813mr1425340e0c.16.1793201055187;
        Wed, 28 Oct 2026 08:24:15 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34673743f8f.45.2026.10.28.08.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:24:14 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:24:13 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] phy: qcom: qmp-pcie: Add vdda-refgen supplies for
 Glymur
Message-ID: <fk26762ufbssofc2hpm6skrxk5ox2yie3zusviaimik3ueowkh@2tcgguspvque>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
 <20261013-phy_refgen_1012-v3-2-f28305289499@oss.qualcomm.com>
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
In-Reply-To: <20261013-phy_refgen_1012-v3-2-f28305289499@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXwNH1bkC4R+3K
 fuFKHteST0dTV7BGN3gS2m6B0GTjlQOmoXi60K68wwKcRSxlCTKvCsBIoYMQYe3wALN72SuMcOG
 NHKn134TraRBmemiDv/16gl+u0Dotv7hfpyoENyImbCY+CQSmRgwiwwviIkFkXqVXqVwg9lxMu5
 KmdaxdDfVbg0uIwRym8ma84PNbs2/yiQMmHdWbHSQjYAbHR9lXRYkm8j/Fe8fRA75O07mtSa9VO
 /jW1pXg5bHtMZcUvnVtLKdzHVVoWKRVSe9duiHRAVjK4PpTGoTaIgG+7YEJyNcIm+tzNeMNit+C
 nrE8XAp0NEfVamGvG9fSn3i8COBjTcvUJ7c6KGcewHEhr9T9BcNk88Eiwcw98Ndj6joKUAwf/N2
 wIyYQl3Eo3xoveNSlisEcU8GPUuiuO7YoAiFIYuHooneemS7ppo3QaJsUnJNlTK1KiTwYIp22aU
 9SBCNb+L3xRgD9RefbQ==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae213a0 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_YrMRA3nyeZEwJ_tkEoA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: MltYyqJFOhM9N2_Bf0YkWA4NRDUkhLgc
X-Proofpoint-GUID: MltYyqJFOhM9N2_Bf0YkWA4NRDUkhLgc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX/UNfKqVNPkY8
 yX0qI/HTZAjgQWUdMZjvbPr6eePn38UpeqTVIEfEWiegHFHApNI5GWHYIYHEsOol4zltfTlcfgx
 kAHPMc3sglxn6wC1qlWqmm324zdArkg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-13 03:16:46, Qiang Yu wrote:
> The refgen providing reference voltage for PCIe QMP PHY on Glymur requires
> two power supplies independent from the PHY's core and qref rails. Add
> support for vdda-refgen0p9 and vdda-refgen1p2 supplies with a dedicated
> glymur_qmp_phy_vreg_l list.
> 
> Update both Gen5x4 and Gen4x2 configurations to use the new supply list.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
