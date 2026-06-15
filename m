Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCA229827E
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495659; cv=none; b=DrHSy7+ofcUzhZ9rFPSUJyMRwCUXO7ThliUbpAeK8NcP4hpqvhlbe96CkxO+u4hV2gVwlYolS8nlvj60nmAx79p2lboilAs3mkGS5Sx+IOEOCUgvxiJLX3D/nmoc2Kvk/KQ7st/7joRb6xNuzqltSd3OAjp5k0wQm0sjT1V+AfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495659; c=relaxed/simple;
	bh=6y3FsOO+p675zXpE6We/uvGFktDVvW4kbbI0mSbG4yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQbfYaRvsRhflD84rEI6byiWbXTm/+fu0UI73sWpwKt1s4yNlSfPreCUbZu9u5nV3WtrLqBeJenxxHFvqjJ4qzoBOeCTOa3EXHrHvbHqcoQkIKT2aLznGZccX1uHlqshQGake5lAJ+qOZ4bbMawSjWNTD1W8M3Wf0O5Bpo2jEo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oD+3sASR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnbrHbr4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oD+3sASR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnbrHbr4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kRsi3287291
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Aj28ezwhv4TnokMoW4RbU6QQ
	Lc/XH3Iq3Hlkkr+sF1U=; b=oD+3sASRNbigJz2LV03W9rx8BotwZ+1JfdwAXSh3
	4NIBVpJig6Mb/IcmtFvQAuOs2aEGkmZIHXPOUA8waMIixhnhQW69l1qbGmxCzm4W
	aWqW64mzWU+ZISOaN4fNIehO3fBhtfNCsfXRSNtTX9ZkHOsc6LtJ++nNFKGBtczq
	B+ZudPF5tCQxgCe96CU9aKwnz+rvIm0hV9UWimXzFwdCVqq2WASvxzlCXc+Gehza
	2W6s9fFP88QeirTC4wOayo0Mht/W24kqwYLlVUm1A35YoIeetD9TbYTJjXI3W0aR
	FbKX2DxZy3te03iYfEenoUym0UVN3SzrbaeA4N0uq4Hh8A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wwcwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:54:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36ba98cc003so1981433a91.1
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 20:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781495656; x=1782100456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aj28ezwhv4TnokMoW4RbU6QQLc/XH3Iq3Hlkkr+sF1U=;
        b=bnbrHbr42Z3U/sZPW80KhSWrJIZqaXstJTrdGXxgOemyEzL1vMGODuoOdk4ncgzFbM
         UhJACj8UtGPVPEWw2vVx39LShBdcsYHDCxlug8KNmYnO6JA0kO86+QzOhKzgCVzsZvFZ
         cHHy6fg1elKdtQW6n4qv/08AIEtAWv7bDDpXk9+qJVIEwEM4NGa7+XAr5CuXPY5OYMs+
         UJUvwogXbCXSITrGYS8VyYEIHJ4xF0lOg0PzJdRtpGNfZDE6nz9TOAWr5EV3y5NWqX2s
         +SdnSd4SAty7uArA/Eb8zC0TtpErsfZuaB9cFEHf6FPH7KMJ4fM/ln3infyzqwgWg0y0
         hmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781495656; x=1782100456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aj28ezwhv4TnokMoW4RbU6QQLc/XH3Iq3Hlkkr+sF1U=;
        b=Y4pwZ4NPxRKDDBNPCJTEnhyUBS74iZdO7ZqlA6LmfqsGpnsli6d8oNBATlvI6c3W3I
         id86jxprhp4KU8z2nL9ac8gGdVbKhUzs06gdSN9nv3NKG+3s3IOXz3JhTrs92PL93bKY
         qTpyZYLwoPCbkSio9f+tRwh0H2Fgpc2l10mzQFvcI7Z8cM3VsnQPcTwrOYSQxF4Z7lDS
         2S5yOyME6O5hMsJHbPhqP0lYvhI4qJ45UcpkV/ycB2ZVnzbCxb8N/2RfG+pCYF4WbHTY
         wLJUi0Pm+5VpCzotO7/7W7bzfNTuQpPGM+BK76cYNYmL+f76MN5nQEhenCKhezHI7Rtf
         zOlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ydQzm4qCzvNTv2MITpLgIdwX/qSXjoYfxNrpP4E3MHOgUYeTuEBnKN+a+YW6hMj0VSS1sV7sfJ7A/@vger.kernel.org
X-Gm-Message-State: AOJu0YxISRexp6zommhGe2QZzMkTHfY/BIug47a7EkfdiXOyK88apJBn
	sUEI19QrREeEhTibgjRwN5iSWqrbyMYjiOr7NVDTVJmTFCVHgz8Rqa/davWfL6kiRaIfwpJxhzk
	XAT9GiZ0pX2fD418BfmHo6IJRhTqL9g3fsgaziY4kzF0u9u2yhVSbL9sqMhVOLTPI
X-Gm-Gg: Acq92OE6I//Bfk4dGDzNYWlKkqHHQyGp2Be4WQ8kJIYNasNYAM6gqqG2Ca/XHijFKJc
	PEgPT3xDkmGzpGvGVFTlLSnFWQfTCEmbgOBOLzpI5A7npri+ilhB1etF9z9oNCoGuete/NSZn6Y
	ArksubEPdccUcHpL89ztDhjOsQS34qLZqfbaVVc+/mENfsSM9KcrEql4d90T3AWJnxkLv6UHg62
	VCs+tCkHwLV9nRtwE/QeBhDA7WUODSMQZGziPwQl0uL+Zx9x1nPwtwGDs+2zyrZX88yIxTElMY+
	Lr5wdI+FiGm0LGrXAsgaCMCsyMgslecBVXrE1ANW/t6rSmfG1W7fzebDmJSBq6Wvp9bcp5+zyhw
	KZ0NhRy0kx2k7ww0VTw25N6NA28G90DQfOTQ=
X-Received: by 2002:a17:90b:5865:b0:36d:b662:708e with SMTP id 98e67ed59e1d1-37a0202ecf3mr13816815a91.9.1781495656110;
        Sun, 14 Jun 2026 20:54:16 -0700 (PDT)
X-Received: by 2002:a17:90b:5865:b0:36d:b662:708e with SMTP id 98e67ed59e1d1-37a0202ecf3mr13816782a91.9.1781495655578;
        Sun, 14 Jun 2026 20:54:15 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a262adbe3sm10477963a91.13.2026.06.14.20.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 20:54:15 -0700 (PDT)
Date: Mon, 15 Jun 2026 09:24:07 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to
 use DLL bypass
Message-ID: <ai93X/cNWHtEQsDt@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
X-Proofpoint-ORIG-GUID: Mmli0Kd5_zJmI9S2Nrsd_F8wvW27WloR
X-Proofpoint-GUID: Mmli0Kd5_zJmI9S2Nrsd_F8wvW27WloR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDAzNyBTYWx0ZWRfX5nk0Q1u6wzkT
 /KpejeguUUWxj+ngC3xUDHOTcYGS7Qf3QymAhVkILFfOb47Ri+ESd3qZAJYKRTZ6nu37e1grwda
 4Fm/Wd2StTX/0e2+qa/Zc0We9fqpLPA=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2f7769 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=h-cV_6-i1hGX5lmYmEcA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDAzNyBTYWx0ZWRfX9xJfO+B/t+oe
 z+UbMVWL6xUUHsenc6My20Zt8vojpBEj5Q8ayXbM3d3zS8iY92blhKauBydxG1QgiLqi68C85su
 XockxBrXqw/TYAreTBLuK5XRU3l/tC21EH5ViIpWOyG/1idYDMifCaBwMGiKtc2tzQ9VGwgWePZ
 ThMNQKAWlk/+b6Hjg1q92Yf8hsL63xu9i2EKqnjnmct856JwbJy0CjQ+wla5oQrsM+LXm1L37aH
 ziK2IVaEwTmMJNoKJ5KG6xBp2Yoi4scuk3iElbYfrnqYLIRZ4X7ExMYhtAabdOIvYD/L2kCeskS
 awsnYC/xFUrC8NYngh7RBf12NWOyAzvU3Mdzh6GdtcNdKD9y1tKoFuuOstG812BTIJYsJLL0bTS
 dpHeZtt7tyAitjBHF6mCtyTgNqgPC3UOvniOuNbqARPYQqRAjC/aQodZdz0u2tBa38wwQo68Pmj
 P+psFIJhlX0DCsOXwDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150037

Hello Andrew,
On Thu, Jun 11, 2026 at 10:54:37PM +0200, Andrew Lunn wrote:
> On Fri, Jun 12, 2026 at 12:06:59AM +0530, Mohd Ayaan Anwar wrote:
> > When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
> > the MAC must not add its own.  The driver currently falls through to the
> > generic DLL initialisation path which programs it to add a delay.
> > 
> > Power down the DLL and set DDR bypass mode for RGMII_ID, then program
> > the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper.  Also fix
> > ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
> > 100M/10M, and remove RGMII_ID from the phase-shift suppression in
> > ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.
> 
> I'm curious how this works at the moment? Do no boards make use of
> RGMII ID? Are all current boards broken?

Searching through the DTS, I found that we have two boards using "rgmii"
(qcs404-evb-4000.dts and sa8155-adp.dts) and another board using
"rgmii-txid" (sa8540p-ride.dts). No board which uses RGMII ID.

I don't think any of these boards have extra long wires which would add
PCB level delay. They are against the netdev definitions for "rgmii" and
"rgmii-txid".

But the first two boards should still be working fine since the current
driver programs the IO_MACRO to add the delay when operating in RGMII
mode. I am not sure about the last board. I went through the different
versions of the ETHQOS programming guide, and it should reliably support
either only MAC side Rx/Tx delay -or- bypass mode (no MAC side delay),
with each having different clock requirements.

	Ayaan
