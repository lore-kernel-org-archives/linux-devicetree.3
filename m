Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783119;
	b=Du5LEMhoIlgM92zcbEujQOVwTQ+yD3EIvj4SmE/Dlv7cmJqrs9HMFN08lHnI4sxki7PN
	 fds4yZn3sCoES1bKhOawSrcGVDxFOBQ7HsMrryZPM055GuB6FjAIzk4Mb1WGNP2WHECV1
	 LhGt0fzpdi6sLEXdFP9T1GNwW6FJk2pEGwEobcfkRP8TOVLrUqUqSiC96tHEN/rjVj7Sp
	 NrwtN9vasciH4+IdsHp/mnG1vKG1piEdh6pr6W46M34B4pzuTre1DfxDT0jmtAicMVNXE
	 aazBxCj7lYXz+x0FtCy8qB4RBYHdVBGJ3ioclnDQiQk5I+nkaKUUz9cUjJDMqeSWhiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KBeG/uicFl/5Pl1WxPYzj06Xh0SoRsIpVAvc4j63tMs=;
	b=GtvXi7Wyrd0mL4OhLQTTWzOmBxWg0oLEls/NkybvyiCL3unv/7qN4rEkf4W4UY/zhDN8
	 jFxDXXxbjozDeA7xvQxyru/P7+azxyhl3E2tDNSZtr7mDtG43f6Cy+J7Be9mrO0q/VsWN
	 Tpm4LHLyzcGXH4F4AbXZlU76YqvqxXo7K6c731J3NfcahFvyZg1u98U3NgKINCZ6gDtGf
	 ZVdJnItEmnjz4JWfPCA3/2Idpu9NfKnqn0fi8NqbfTgFAschik3EPWm93ct7GHloG9SPy
	 aoIN8P7dScNbXy90Bz18K5lcz5cS/uv6Lq0rb8FKU5ZlF1BPvDFNOe7RQ2gwCs820aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwSafNQQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bygwT1e4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA25606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 09:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA25606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwSafNQQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bygwT1e4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KY9n1874525
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 09:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KBeG/uicFl/5Pl1WxPYzj06X
	h0SoRsIpVAvc4j63tMs=; b=mwSafNQQF++T2mhvQQzZuT6DGOKLYs90hfwpYHFe
	tLmBK/U4aLOQKYeN021mYi7FYQ9/EPO1jQr36TZ9QvMsJhuvb1FmF8ZknjH4JK0Z
	hHqwvSprqcquPOJ3hgwlcvIYrTwD6IovbfvnXaTryLGYXwkJzhQaSXuxuCzV71bX
	44A/9iKt8P5/pNm3bmPtbxbAk7k0gSv7t0lWTShgukvOhiCpDWTTYPjCV62WYFwJ
	9od02D2IvOYaZhOsKkKfTe5pkRP3D5YnYnNgYvk9YoKwW9KOJiaASnMDV03yTTU8
	cTucMLdbOYNSNB2lKiGZ2PMAnVk2Yyy3P6cJs9TMEPN8Fw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mu1y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 09:05:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adf71ee6a5so903782a91.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 01:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783117; x=1794387917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KBeG/uicFl/5Pl1WxPYzj06Xh0SoRsIpVAvc4j63tMs=;
        b=bygwT1e4rKFvFzo1NVcUpts1Qa8QcF8hfnS5YQKYPWURAMuvnFbrtOnzf+CFBxWTYb
         2+zZze+VuQERWW7i6//I2GY6v6i7VmfyhW4wgu6DxBTAFQGpy6bpFFXolNRlRyKtCmF4
         YpE6gX+zBqkW2RBxH6lYRcBnOurLv8zHyZKCHA7XGcjWTVP89OsRTIqVuJWD2yqfJDsD
         bQ+9dQ22KSgz4CqjWrXuumE+Y5RdQgnAa3hYhaLFJPo4+VzbpUI6JMl6RcADKTJXiKqd
         J5vKF5PyX3kvdinrPqPjEkLJ+41Q2IYf2Pxv/ZH+Pgz2GQ71tDaq1gcuH1M9JT7Y2b22
         bBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783117; x=1794387917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBeG/uicFl/5Pl1WxPYzj06Xh0SoRsIpVAvc4j63tMs=;
        b=y27midE1MuyPbx7fKX0NIidhB11zM146g2YTtBC+MEXjOxcG+H5ZrWmrMLasEjkKYU
         Qz7rDbg8+1bIZ6RMJ8Pq7m/JXpJ8nfzbL6LZqM7S5KGbTn84/JZQ5uQfLSTn/oudvVbp
         hwc5PZHqB3NFbmfBiX5Zg1kBoIQrzzmJfILw7YdfycAkgWHHb1O/MBnqykw2tRgtLVwj
         VlXU47BnR2TNcl1ccA1WwZm8beZIfeiiB2UIhfZ9yT+Jdx/poPu0hjb2qIYjbOfCN2Ir
         GIQDioZHTTSmsfcRlxqe3aa4R5yq19U4eV4TlopHfDD89I0Exq6cThSwhJhf9z+Fjz5E
         J3Ig==
X-Forwarded-Encrypted: i=1; AKwUvBw93TgxiWDusr1YhG7bEVcK0m88X9IN2sQ7xHSvtrY4AX1ZHUewtOFY1Zvq/I/qiz3/eFbEsPqnvdQa@vger.kernel.org
X-Gm-Message-State: APuU4Z8NZSGfUspD4uzqH6sAM9mQW92vCzhVEhPrVLQ54yQGUBmeucgZ
	qAXiDKX882A+lnMRlugiaFmiwPgTULFIPga2aLfDlxiv9ec8HUNucum2PflBhVmzJRt1j0J/8XY
	HD80uBC1h2lnLX7WL3DFyRpt1Y/gdf71ifOYftJBDkVD1t6xi7EjAkrggM9lHQ4AAd7793zFOC+
	M=
X-Gm-Gg: AYBFou2eqBG3wMnmeh4zOjYOnXqr9Yep/9CMM4xd4WQTjtixbovo5qnjquENaipS66w
	WIkNw/2dB+UP+kjokZUiv6UDVPefHYxC44/5N0A/uY09LD++w4EOosfzqaLTT1ppiERIJlz6yr4
	qXPSc5AfLN/MHb5B/t1mrmScEc7uj9YzkTi5aweLOmSOhSvs/vXJ4//7styEgYYUKYyeM4guL61
	jAhF3MRfXEmL+szohZwbiPM/QS4TE3cmYsfy+f+Aqzx8I56XTWq8wDiNhr2B4zNBg3cEJkF1IDW
	P2zUioQOV6+Ljh/acufU4yNZWrluUvR/5HbQEGFODJU/eR1bZUiJEVMn48ouICt9hiXBvbgrKtL
	rWWCDoDXEPJuOWGzlgaJ4EzWBYaPYC/SYTaTa6PSadk33NtMpb/4Y3TjeHDGpliguRMFqASkaWp
	AmdUd300a7r+x7BA==
X-Received: by 2002:a17:90b:1c12:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3ae89286698mr12218412a91.0.1793783117261;
        Wed, 04 Nov 2026 01:05:17 -0800 (PST)
X-Received: by 2002:a17:90b:1c12:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3ae89286698mr12218395a91.0.1793783116784;
        Wed, 04 Nov 2026 01:05:16 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8b1913sm8533760a91.10.2026.11.04.01.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:05:16 -0800 (PST)
Date: Wed, 4 Nov 2026 17:05:10 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
Message-ID: <aur1RlNm2YLYdaxb@QCOM-aGQu4IUr3Y>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <6234d23b-09b4-4a78-a2d0-35a71cd70504@oss.qualcomm.com>
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
In-Reply-To: <6234d23b-09b4-4a78-a2d0-35a71cd70504@oss.qualcomm.com>
X-Proofpoint-GUID: eF6ni6cmAxEtQRVV11j7CC6qnZE8F52c
X-Proofpoint-ORIG-GUID: eF6ni6cmAxEtQRVV11j7CC6qnZE8F52c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX/RxIs0ZUDDbm
 rK791g1kYQDUxuElEzqvIZKgZHNLWSLBdIVeVPFnKYN+7EBq/TPBiRVhWgWrdtov3z/EdjcG9Nl
 UE+mGFvCGcD83YcyMlivU4AawhejSaK3dwtfEwne3Qi6zuWvDqQVcHPxi7WwJEvjDjPDbvn5XZn
 eX4hQ4uapMhqdmgVhr0bRcesoBcdhhm/Afw0khOmTWaN4mQr++HW/nPmgXLKbKDxio71lkl+hwQ
 skZmqi5oUKf9tBA5HJCwQJouA00JquBsRGhsx+Mshzq08lOcItU3r/iqqK8tlOI1QMtutw3G6GF
 pz/Qzq3Sxd6kMrBwjIJuskQ4bPMhPvEDuBYuij4xFaVF+BE0kSVaDFfvVPt2CC2ik6GnmFo9nqY
 x7QqFjSclfQ5FueE2yxkRXHGYswFveWPNYID0RDEBW2hwGzaWElLAKKREdh+GCNgs5R2Ey+6HUE
 PPUpmqoYHtBoVbZAt/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX0lzHmVXGUZOj
 eMh22QORQD2a75jwEpU58TV0heFZZ7hiZzgvBRDO/ALj4xuXq8N/z4lX621ioBHrah8O7ynJvHh
 xA7sLcycWYZR0bj7MnJ64MBYn0/VtjY=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeaf54e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hOQGxnIeUdGwE_sWoTcA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040036

On Mon, Nov 02, 2026 at 04:03:08PM +0100, Konrad Dybcio wrote:
> On 11/1/26 9:04 AM, Shawn Guo wrote:
> > From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > 
> > Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> > SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> > and DMA queues.
> > 
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> I think we can't enable the ethernet hosts indiscrimately (I would
> love to be corrected here!), can we keep the XPCS nodes enabled by
> default?

Yes, we can. I will enable them in nord-embedded.dtsi instead of nord.dtsi
(to avoid CHECK_DTBS complaints on GearVM variant).

Shawn
