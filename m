Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794840219;
	b=QViqaDEdrn30ugFMMX4byz2m2aqoNst2ZgOeP3tDDxl2xtgrvmHYh0zTWNE8Wn/oZJsd
	 0Lx/og7dNCfz3dP8hriBn945hzuiLb2q3auCqeau0dEwDA8C8wqaTojbHmcFl0a2pkfCY
	 Ni1I7M3cgFILH1tbHF/I5IMTbibDABpfHeV49WoNMzxINM8YsUkXzUKjosi9zDE4g8NzI
	 g1MXpN6RtuO3gDHpWfdTbI/3SXnBZNmyUHHQ7gvNscYR1gOMB5dlMowwv+xVP3gAASpxh
	 CUv+d+RLu0CPTpDAoc5b29fZSbTs8iWWBfsmwqyR+2YOotECdyyxT7KOB6BFcLRK0mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=99tPBASnMsQoEEem09X2b+vCWXJSKFkDcYEJLVq5QQw=;
	b=f3FAsUeRiyQVRuyR+aLql6l4KLa3dL7sBHd+08KHUBvGK1THThjPnsfIJ8DG1dO0dpNR
	 S6uFVMMo6dyRqH2+PyaSz2PUbPbD9Bbyqt1qk7ooOlKkfOVzrGxjPZyFGPMYnVq/F0PFg
	 V5nMqspGqGFLpN7XPEHMMv0eNB+WLOa3S0T9F1iuRh7BnWb125WaCrNCwvZcJwksHx7Jc
	 Dxx6/O2Z4ycF73bkcq5bkrqSUGOGPYlSuFMqTba067LFJ/VEw+8vIYvsBH0sW4j9zjdhL
	 VHTflTOxgYBE/uSOcFDzwUehRQt0o7T/UQBiIuNcEZUFgaM8VJGDWiJudBBwL2lLRHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dcs576ze;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H3hBU68/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F31606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37F31606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dcs576ze;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H3hBU68/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrSTx1727177
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	99tPBASnMsQoEEem09X2b+vCWXJSKFkDcYEJLVq5QQw=; b=dcs576zeWpW3JA3/
	SlVKvLItkT0pqWkX77JFcr2tcQAXVweAUhWj8LoQl6+xca+c/zmji7RBc9kOgxES
	053l/EMoqXaGMJVU1Ak0niIXOi/dRTa1dIXm9QcELtvHcRZ1ta6AKfCaVHcf+PKU
	JXDmWVvJUmt8wIuUF2lSNeRu6tu3veJ0afhDCyJPbryAnWG0SEMiBFFiLcFGQcSN
	nP5+fhLbTex6HRRR2DwXBOkejJcAlXXMmGBHGK8bd9aqhRrJbozbsOiiQsvys5qj
	suCD4mXCcbuxxQ38znCPzEoEP/4Ah9m8fUTCSDhZiIXpfDMZkzC1Ciq1RJBKSHVw
	c1yJRg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqgyev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:43:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94607500fb0so216561985a.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:43:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794840217; cv=none;
        d=google.com; s=arc-20260327;
        b=Rd0c/ehPCoEeBauytmVi5AfY9Sz22y0Ruu4iSFwwzbQSLkE+6a+phrII+LbZwtW+JQ
         SKq4V4eMz48yuZFVDJt+yfzaCZQa6uxEe0PpZZZsJWaypqjUsVtw55Ecc4JmIn7uHcYE
         13BQZgqzyA2mXTsVu+rVT38gtzfWlLooJdzsPRhYDKK6NYs74cJnQCK1J6ibLEmWFc/T
         FCC7bpPAmaymTYLVr1VOEA2+2fmsZbV0CXLbFq9Q1B/+eEZYlrWwrGM93Vg7yyORWiSN
         Y52JNWPYXFbJ3m94j5LTGp60SUqbBZFhno6oHFXzKN96YNEVWLIakPP4raMyniCP0uKV
         kzgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=99tPBASnMsQoEEem09X2b+vCWXJSKFkDcYEJLVq5QQw=;
        fh=pX/5LiDINgpLe2TdC409TWfqzM+Rjd3ehH0IXTrNwXk=;
        b=oIVuSXHvU4yDfSbYki75vfKXPUFAIy4wwxk0FoWSof0LVsdA6GoKlVKRk9n+d+x7Rb
         irTjaVXeYjaHn2HLoBYgDHqYtetptlJnM5ibm5TibZDtGIqzf6jTr3zDPMWGwssCJ0LR
         e+QQEp/7wjdRNPFl99nlq+CGxM0XDAtsdhSA8t8VB3Qu+y6ooAUyfviAurjHCiDuzPAF
         L64yo6fTxzbA7ogTLDGqDWLjuJ2MjQHDzimvCuUgTzuCrFHdfdkW+wOQy/1aReNa9+fr
         ol7aTQbiMEopjNSN3/9bHE9dbCiOQTmnwfa7a9xMdaOReLMGSClhiYqlh7sfTqzq08v/
         kd7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794840217; x=1795445017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=99tPBASnMsQoEEem09X2b+vCWXJSKFkDcYEJLVq5QQw=;
        b=H3hBU68/gDEvjiYayDkl0LV0r2r88ykPrkZra/QfzF2lSNqqROY18wtt1PBxVlDCSC
         EXSRsGBkkRR3vUbEcefTgSiPFKy+Gk8w4TNuBkqr7NzL6kXJFW9QBhhVQDxPt9TFGoIo
         iUk6nOpy13+9TZd4H86ft64RdDQZc0D5e/Sne4WBJfCkXdxksSNDB+365zyWtNEJJEwc
         UHsVPPGtUvUpYo7qdUqhzSEoTVge5SIcghXbFv0Tdb28dAAqul0JlYrCKbF8AqZUv4gh
         rSvMUPvw6YZ+jQHkpfZYCw0WF2PiIpjvzqoItial1IWJ7yTpB8dZO6h8/RQcPuyWPHBJ
         fWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840217; x=1795445017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99tPBASnMsQoEEem09X2b+vCWXJSKFkDcYEJLVq5QQw=;
        b=U7btuIivlpl/crbj9bfLONMGtUI9j8wMmYuDXNIkjBwfI9mJtBga4u/f1obSN/En05
         n39okzeELcvFB56E+7/aVtwILw2dYJXONWJP9eNMBhhnOmnv2pzrBVtq6DVRIp5bKY7Y
         ETa6aX6r0jDMtqViFbFVs+R6iuSjyrsvt6utaNVa4VYaD2F6xpJrStoAa9TRCfIf/Yfp
         ZDhhHCl/v5cDKt+0cgcIIm50jQZlhViR4nIFZfi3DufvOOxnQ0MqJcLveIt5e+IkzSTH
         ATKZz9y0cqplXZ4coXBvsyEnOe0VCqwrrXKa4DbjHjzcc67F4n1PrDERvvFmXVc6PKNX
         XV5g==
X-Forwarded-Encrypted: i=1; AL+hErHrMKexgT85aAQsBSVTRMzTPF7fliOMLS2eOsDPvzrxOYWksVChrUUU8IBMFII/qs/U2/YSofuIfVwr@vger.kernel.org
X-Gm-Message-State: APuU4Z8i69CkMG76hUnj2Lsb0A7a8QvhHb2J2E0FxH1krvkd2NhNnkfR
	qWOUoC/Ze6C8Hb75g2Z0t4Gw5q19N7UWnAdFXHXnYH3hqUeg1fr5T/BmX2cmW02jnv8RYW7C8Zg
	WGAfMkWLdw91tdCHZGMFXu2wg26wJmzVJE5Me5ejtn5ONpm8I9siTybWh+kN6NcWE/s/6bdkqpA
	9X58teWAuCbq0B3EZTyrEtBKggCaLLixIND4RW3Fs=
X-Gm-Gg: AYBFou0j1cnYI/XVNLaD89tfAVokBSixoQR3124brXsyzZRbYVreQI9GmHgtrOYtH59
	NxECEKxbtRJZ6Nc0UbMeUti8xyOsjrcIHn5NnjgjCK1bxP79UiztGgV/GzeKfQV2yCWC7dNcFoc
	brGH7GymcQDC36lxQShDFs7jTj29TwMBPzLZw+A7IE+RrDDJV0V3f6GiVNccP7+q4EGFbkgo2vj
	LBZU5rIF/ST3PmLKSNIVetaxlflYvUzYAmUVU7ttlNYvFoFK419gWLNH4fU9FwYlD9JYvl6dlI=
X-Received: by 2002:a05:620a:272a:b0:949:6e15:e1d7 with SMTP id af79cd13be357-9496e15eb4emr987960085a.25.1794840217241;
        Mon, 16 Nov 2026 06:43:37 -0800 (PST)
X-Received: by 2002:a05:620a:272a:b0:949:6e15:e1d7 with SMTP id
 af79cd13be357-9496e15eb4emr987954285a.25.1794840216706; Mon, 16 Nov 2026
 06:43:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
 <20261112-qcom-bam-dmux-vmid-ext-v6-2-7a16bd3dff18@oss.qualcomm.com>
In-Reply-To: <20261112-qcom-bam-dmux-vmid-ext-v6-2-7a16bd3dff18@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:43:25 +0100
X-Gm-Features: AclHuK_Bk8XOrKfHomMF_JkgHrazKz6XRclBUvJ6QaoKb1UyXuL6aLCAmjha43E
Message-ID: <CAFEp6-0tj2Jnd6EBpLVVsCvt3kTOP61vMuNMV-fmyh0WCu2fJQ@mail.gmail.com>
Subject: Re: [PATCH net-next v6 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afb169a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=0Mq51QQeXCmcnqE6Af0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: b4Tm3_G_Rp_GhS6uT3zvBIB_oGlf11XD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OCBTYWx0ZWRfXx3U0zyWCXmg6
 Qmj93P5iIxQ9VaLj33xx33hS2RGm0T1gbaHvkkspJyucCImmFc9rI0aO5//Q33t+UP8etQoPo5K
 n1MzdboTQI5WLlwXOgoxgYurDxA3zfeArRHsS3ftnRZFKB0xX7VrDUYzT3L6vzMqUnYeNI6qw2k
 sCJeEq/YAK1Bmwr0QSlNEZh5ShL/z84oATn1Feh1hAl9JLBXSsoXnfOqeEfeTQZU2MzTzFkypzs
 sBNsQJ9Ih5sSERyRkQceEnX44sQVEiTgeav1TWY8MmsAVpX4y9OeZTkhXXAqmuUDLVVddTACYuA
 2YwIUdFWAU1i3wqzt6OdviBd3wqvqNb6xb2Nu+jtcTYKdSTE37xS1H3d/tyRlDKn9EPpVz0zvCy
 siPJuh2oB2wk+RTTsvIE9kzdseURmFyj/Qk52xJkUDRt5Yg6u3kcjKwFuFbRq4pj9N4KoCtlW7i
 srd6yENnc3HP4fV9ZvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OCBTYWx0ZWRfX2YpkBnG2qzsp
 ozVTCCKWGkA6GTui8aQ/b8TuQFDusSF5j4mLZfaQjgjkuLggRXfX35OGyuKX5NIMYay0oxyTvVN
 l8EsNi3CQA9OCAAipNJCsfXZKKxuwJ8=
X-Proofpoint-GUID: b4Tm3_G_Rp_GhS6uT3zvBIB_oGlf11XD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160058

On Thu, Nov 12, 2026 at 10:14=E2=80=AFAM Vishnu Santhosh
<vishnu.santhosh@oss.qualcomm.com> wrote:
>
> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
> domain with restricted access to system memory. BAM-DMUX DMA mappings
> and BAM descriptor FIFOs must therefore be constrained to a designated
> memory region that can be shared with the modem. Accesses outside that
> region can trigger an XPU violation.
>
> When qcom,vmid is present, require a restricted DMA pool and assign the
> entire pool to both the local and remote execution environments before
> requesting the DMA channels.
>
> This ensures that BAM-DMUX mappings are within the assigned region. When
> the BAM DMA controller references the same pool, its descriptor FIFOs
> are covered by the assignment as well.
>
> Track the assigned execution environments explicitly and reclaim the
> pool for the local environment after DMA channels and mappings are
> released during remove or probe error cleanup. Skip the reclaim and
> leave the pool assigned if the remote side still holds its power vote,
> since it may still access the pool.
>
> Request the PC IRQ with IRQF_NO_AUTOEN and enable it only at the end of
> probe, so the probe error path cannot race with RX power-up.
>
> Fail probing when restricted DMA pool support is unavailable, when the
> VMID property is malformed, when memory-region is missing, or when the
> restricted DMA pool is not attached to the device.
>
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wwan/Kconfig         |   1 +
>  drivers/net/wwan/qcom_bam_dmux.c | 103 +++++++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 103 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
> index 958dbc7347fa84ee869439bf8b503037faab8bef..1b133c5623161526969814018=
7ca3141dfe48dbf 100644
> --- a/drivers/net/wwan/Kconfig
> +++ b/drivers/net/wwan/Kconfig
> @@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
>  config QCOM_BAM_DMUX
>         tristate "Qualcomm BAM-DMUX WWAN network driver"
>         depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPILE_TEST
> +       select QCOM_SCM
>         help
>           The BAM Data Multiplexer provides access to the network data ch=
annels
>           of modems integrated into many older Qualcomm SoCs, e.g. Qualco=
mm
> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index 1479f8362e04e4a5f60219922dea3540921de13d..04f3d46d4c3f3e18cd5313a40=
7b8096d04dd857f 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -9,14 +9,17 @@
>  #include <linux/completion.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/if_arp.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/netdevice.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/soc/qcom/smem_state.h>
>  #include <linux/spinlock.h>
> +#include <linux/swiotlb.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  #include <net/pkt_sched.h>
> @@ -75,6 +78,9 @@ struct bam_dmux {
>         struct completion pc_ack_completion;
>
>         struct dma_chan *rx, *tx;
> +       phys_addr_t dma_pool_base;
> +       size_t dma_pool_size;
> +       u64 dma_pool_perms;
>         struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
>         struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
>         spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
> @@ -760,6 +766,88 @@ static int __maybe_unused bam_dmux_runtime_resume(st=
ruct device *dev)
>         return 0;
>  }
>
> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
> +{
> +       struct device *dev =3D dmux->dev;
> +       struct device_node *rmem_np;
> +       struct reserved_mem *rmem;
> +       struct qcom_scm_vmperm dst[2];
> +       u64 src =3D BIT_ULL(QCOM_SCM_VMID_HLOS);
> +       u32 vmid;
> +       int ret;
> +
> +       if (!of_property_present(dev->of_node, "qcom,vmid"))
> +               return 0;
> +
> +       ret =3D of_property_read_u32(dev->of_node, "qcom,vmid", &vmid);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to read qcom,vmid\=
n");
> +       if (vmid =3D=3D QCOM_SCM_VMID_HLOS || vmid >=3D BITS_PER_TYPE(u64=
))
> +               return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid %u\=
n", vmid);
> +
> +       if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
> +               return dev_err_probe(dev, -EOPNOTSUPP,
> +                                    "qcom,vmid requires DMA_RESTRICTED_P=
OOL\n");
> +
> +       rmem_np =3D of_parse_phandle(dev->of_node, "memory-region", 0);
> +       if (!rmem_np)
> +               return dev_err_probe(dev, -EINVAL,
> +                                            "qcom,vmid requires memory-r=
egion\n");
> +
> +       rmem =3D of_reserved_mem_lookup(rmem_np);
> +       of_node_put(rmem_np);
> +       if (!rmem)
> +               return dev_err_probe(dev, -EINVAL,
> +                                            "Failed to look up restricte=
d DMA pool\n");
> +
> +       if (!is_swiotlb_for_alloc(dev))
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "Restricted DMA pool not attached\n"=
);
> +
> +       if (!qcom_scm_is_available())
> +               return -EPROBE_DEFER;
> +
> +       dst[0].vmid =3D QCOM_SCM_VMID_HLOS;
> +       dst[0].perm =3D QCOM_SCM_PERM_RW;
> +       dst[1].vmid =3D vmid;
> +       dst[1].perm =3D QCOM_SCM_PERM_RW;
> +
> +       ret =3D qcom_scm_assign_mem(rmem->base, rmem->size, &src, dst,
> +                                 ARRAY_SIZE(dst));
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "SCM assign restricted DMA pool fail=
ed\n");
> +
> +       dmux->dma_pool_base =3D rmem->base;
> +       dmux->dma_pool_size =3D rmem->size;
> +       /* Track the destination VMIDs explicitly for the reclaim operati=
on. */
> +       dmux->dma_pool_perms =3D BIT_ULL(QCOM_SCM_VMID_HLOS) | BIT_ULL(vm=
id);
> +
> +       return 0;
> +}
> +
> +static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
> +{
> +       struct qcom_scm_vmperm hlos =3D {
> +               .vmid =3D QCOM_SCM_VMID_HLOS,
> +               .perm =3D QCOM_SCM_PERM_RW,
> +       };
> +       u64 src =3D dmux->dma_pool_perms;
> +       int ret;
> +
> +       if (!dmux->dma_pool_perms)
> +               return;
> +
> +       ret =3D qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_pool_s=
ize, &src,
> +                                 &hlos, 1);
> +       if (ret) {
> +               dev_err(dmux->dev, "SCM reclaim restricted DMA pool faile=
d: %d\n", ret);
> +               return;
> +       }
> +
> +       dmux->dma_pool_perms =3D 0;
> +}
> +
>  static int bam_dmux_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -794,6 +882,10 @@ static int bam_dmux_probe(struct platform_device *pd=
ev)
>                                      "Failed to get pc-ack state\n");
>         dmux->pc_ack_mask =3D BIT(bit);
>
> +       ret =3D bam_dmux_assign_dma_pool(dmux);
> +       if (ret)
> +               return ret;
> +
>         init_waitqueue_head(&dmux->pc_wait);
>         init_completion(&dmux->pc_ack_completion);
>         complete_all(&dmux->pc_ack_completion);
> @@ -821,7 +913,7 @@ static int bam_dmux_probe(struct platform_device *pde=
v)
>                 goto err_disable_pm;
>
>         ret =3D devm_request_threaded_irq(dev, dmux->pc_irq, NULL, bam_dm=
ux_pc_irq,
> -                                       IRQF_ONESHOT, NULL, dmux);
> +                                       IRQF_ONESHOT | IRQF_NO_AUTOEN, NU=
LL, dmux);
>         if (ret)
>                 goto err_disable_pm;
>
> @@ -838,11 +930,14 @@ static int bam_dmux_probe(struct platform_device *p=
dev)
>                         bam_dmux_power_off(dmux);
>         }
>
> +       enable_irq(dmux->pc_irq);
> +
>         return 0;
>
>  err_disable_pm:
>         pm_runtime_disable(dev);
>         pm_runtime_dont_use_autosuspend(dev);
> +       bam_dmux_reclaim_dma_pool(dmux);
>         return ret;
>  }
>
> @@ -877,6 +972,12 @@ static void bam_dmux_remove(struct platform_device *=
pdev)
>         disable_irq(dmux->pc_irq);
>         bam_dmux_power_off(dmux);
>         bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
> +
> +       /* The remote side may still access the pool if it holds its powe=
r vote */
> +       if (!dmux->pc_state)
> +               bam_dmux_reclaim_dma_pool(dmux);
> +       else if (dmux->dma_pool_perms)
> +               dev_warn(dev, "Leaving restricted DMA pool assigned to re=
mote\n");
>  }
>
>  static const struct dev_pm_ops bam_dmux_pm_ops =3D {
>
> --
> 2.34.1
>
