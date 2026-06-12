Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149D239A058
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255501; cv=none; b=Ds6T8yfXGmAIo3HBzylZ49Nd7jNS98Sqm+xP2IhVK3KBgKGkGh5ywfCNt5cVI9Ywihtt8qoyed9Yqvz6JiNd3B/BLqD41Reu3THMKr8FsrDwDuVdkRN4rVDRpL4jqkTlF7CHDBF/uETzmRqMn9KyLk9ZlQAUYeJwXCrvXjgFaFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255501; c=relaxed/simple;
	bh=HVX+df4r4r4dxwN87XOAKz4MPubjc4ZqELInIOqinR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lE71WieNYqDUraMH1YDBQRXy0ufO2YnCkZ24jlO1g6IiTohSLry+sdrmMpmoSkkwEKbPAS+YSrrbFOl25PTTQX4kehyExFYR/9JXfgWMRzW8pWtcWfIn5qBHdtiZPmndT5JFUgp2Hiob/ckF58yGQF+7sxgBwukIDuvpfm2jJxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVuTXDZ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJjO+9fk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVuTXDZ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJjO+9fk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39oal2411698
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MWlVxwNP0J33Tyh80UZciLId
	M0pPmHRLu6KbBtI6/ys=; b=aVuTXDZ/skZo9mrZ8H+DnfiSbPM3ru7HoXwGU7V2
	VzsH4v1NdM8uz2jofMhDBBSpV/dVsA+FHFT0XcAn0Rnc9jW3X/f46s0JtVrOK7dx
	IhHaqUk4N0oIWgVSGDtip7qjoKGlwfImWHQlV/Gpq4TqIYlKI/pr0kOhzdCPU60I
	+UwtIs1r7wSjgjYoAYfLpZxuhEGfCiQXZaoL09qwrDApCKR/4omYM/FdwiGOAJBK
	kigAO1j5mBber8zp30yI+XcnRqojTwNqgrZa5FIDVjo8UL3hkHgZCiMUja2ng8Qt
	LSdiyHjuYU4T+2qxZ+wGNVm61P7Bei8Ky2LgN6r3JlGolg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165av5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:11:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517e054fe07so17899251cf.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781255496; x=1781860296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MWlVxwNP0J33Tyh80UZciLIdM0pPmHRLu6KbBtI6/ys=;
        b=VJjO+9fka4La0BpK0RSipyIxHR93KifwVPO5rVu5dMpTTU5zqLsm7sfV+6lH8noI/C
         5r1GpkW2G6ViM15P76LEQMZSYK2IzVfAzj5XoFrVh64xJbe565xNnX9CG3w2SBbD034r
         7BVw/Ye6BKIIZj/ioHBEh3KVMVoVY890P/NbEp4XHubjG7mW54eWaQCmVZBU66xyEczz
         VB++Io9PUjRojEIPA9C/4qxw6mjRLO7pWPKlqxcqqe0/g1gA9Gp00KHAE1N6ZCTQ9Gf/
         j6RL1lTFL98Q0q29jt7v/Y7Uj35JEp4MpgVKqPW8dT1tyrePpyQ3/ZtD7uPBut0P30x3
         94/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255496; x=1781860296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWlVxwNP0J33Tyh80UZciLIdM0pPmHRLu6KbBtI6/ys=;
        b=OypLbzvZCK/V2EckA19Lr30ARuq/d9UpRLCSE1qhP1YGWQvUaBECzoUtFNelSLgK1T
         p57jLi6VXL3VqO1G3OpVD9ythbwDKm+ylyEUj2ExOnKMqzlFmBNxH60FQ8x0SKvE+xrt
         61ayW2+6QOum1s71oEbax2OikZ0NYwmfv6ceGdoJX+WjMPchMEIaVEi83X/oF6hbiF42
         sFgWg+G1c7m1E1cgOk59AxH1GvufDkxeZ/D277FOB5lxoQ0MXQPdCjk1Ubx0Hq/He2Q4
         /yb24mI5Q6JyGk/sg5veL/2pve1Qe1TWCrUiMAbRjEz9nv4ACZFRPBdf54VNTo0n3Hha
         jSaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TI3nKnXgrkFdzhosD/3E1EY5EJdf+2dTwunzI+laCA16YRD2nwwEzvqUwR7keQlAsHYMaot8s7aFG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1t5/jBjJM/cvjZq1F0m1DIjN83zTYTdKZKKmVFoOtp976EvcV
	KwFqECiYxcviQPkII/gX8L1DRsxs4MdIgvwHM6n0wlWWoK7g1qLApxVBZdvuUZTOfxR9qWxsrSR
	4ocsWQPEymMF7yrx5B8noiFAuDWpttH54SpP1n2baEwjES84xJaAkOKs87v1Ek+lksWe7JcxQ
X-Gm-Gg: Acq92OGjtkIyXa7fx+hM2s+scay58WVl7iWBLKldIbN1Fi4n2+5bWph9pWzCe05+dvj
	l6fOnPk0OxclyTqo5qjV94H5COCl34g6CU+3zc/IjEE1t1iGVfeBpAscZiZlgUkbRxKKRbJZqn3
	XE2LfljilPoQ/A4katXStbgwqO1qMjgL4efxaTsXw0SNBSArk3FqANfRQlsveSMPccM/wqeBucp
	ofmftgKkoZlw13f5MACdRaW9nAydGhKoho8ZJJIYEvVdHzE6ZGG2y9pZaaszvKKS23caf81nxjl
	jkj5HFM8QjODDCSnlEcSuwQw42nR0ck91whecwJU//MpYll/qQXbEvj91Tdx6ie/hn7laoswDWs
	ML1Zhrz7kD13+vy4bQTCUK9/RtYbD/PpnF20tN979sT9w2jG0vb4hUliZvsxjLefBe2mtKcU973
	MGXy2LsrS2lhCM1JcrKoKo0TmIDyGaEuiGO8s=
X-Received: by 2002:ac8:5a41:0:b0:516:e10f:7140 with SMTP id d75a77b69052e-517fe229bc2mr24342351cf.35.1781255496141;
        Fri, 12 Jun 2026 02:11:36 -0700 (PDT)
X-Received: by 2002:ac8:5a41:0:b0:516:e10f:7140 with SMTP id d75a77b69052e-517fe229bc2mr24342101cf.35.1781255495685;
        Fri, 12 Jun 2026 02:11:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e170386sm379979e87.30.2026.06.12.02.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:11:34 -0700 (PDT)
Date: Fri, 12 Jun 2026 12:11:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/8] Bluetooth: hci_sync: Add NVMEM-backed BD address
 retrieval
Message-ID: <sy2ofvdbcxspxtmfdavjvdz7oes5ieuep4znf4ayknmuwhrlgk@7lp3bkegaeif>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
 <20260609-block-as-nvmem-v4-6-45712e6b22c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-block-as-nvmem-v4-6-45712e6b22c6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4MiBTYWx0ZWRfXyAPPgIp6HLGh
 PT04AL8gyg50Rw/Wl940fxaZ130mMHW4aPHcJgZe4JTp++vWJUuYW4f0iLjolId3cyKsjs+lYg2
 3eBNMXd0Xksw5cOYSzTbeTQM6/AE2/lq/veiG59pifPOHLEwsFYKxzu0hte6lQT9wtdKqC6d0TR
 eVTig4ge3+6NLYcBXHENvQj8mrHEkww8Bu69r5wBHQFYJTtLGV4cXdKP0wb0QBXADgxo0FLPOiG
 gBHgNcB8o6ysPBwBbOzy4HAcbx6IaCY+XGnRGlEZP/TFyKD+JXDuUi7xZlC3cZJ9/Vc+ZlURdXr
 c1n7T0DqA0kaax4iieGGJQh6SlOfi62UYiKFmeGG+9ECZixkoM7WksPUIkXz5lK7mkqxgoCZBok
 Tw9oVUtaEh+yadGbNBA0OuU8H0VLT05NJnJgtvOrLXbETgqcbdSeZxOO90kEmYuhtiBHXf2i9UP
 eGMrKuUYDSfPCqwgR0Q==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2bcd49 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=dCyu47M02oNEJ4VrFMgA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: K2TrO3A_ws2Y1Qkd5EkZ9-ot-f6Bsr0-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4MiBTYWx0ZWRfX5IykIBa988OY
 hTDWRwYcAxd0dAf1NIYl2KbddM3+rc6NGXnwRbQDs6LflpbAwl9tyXvSw9flCn8LSLZEy4Yye4w
 KxM6bKKbeTegVF52ek6vnHAsL1McHAM=
X-Proofpoint-GUID: K2TrO3A_ws2Y1Qkd5EkZ9-ot-f6Bsr0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120082

On Tue, Jun 09, 2026 at 09:52:31AM +0200, Loic Poulain wrote:
> Some devices store the Bluetooth BD address in non-volatile
> memory, which can be accessed through the NVMEM framework.
> Similar to Ethernet or WiFi MAC addresses, add support for
> reading the BD address from a 'local-bd-address' NVMEM cell.
> 
> As with the device-tree provided BD address, add a quirk to
> indicate whether a device or platform should attempt to read
> the address from NVMEM when no valid in-chip address is present.
> Also add a quirk to indicate if the address is stored in
> big-endian byte order.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  include/net/bluetooth/hci.h | 18 ++++++++++++++++++
>  net/bluetooth/hci_sync.c    | 39 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index 572b1c620c5d653a1fe10b26c1b0ba33e8f4968f..7686466d1109253b0d75edeb5f6a99fb98ce4cc6 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -164,6 +164,24 @@ enum {
>  	 */
>  	HCI_QUIRK_BDADDR_PROPERTY_BROKEN,
>  
> +	/* When this quirk is set, the public Bluetooth address
> +	 * initially reported by HCI Read BD Address command
> +	 * is considered invalid. The public BD Address can be
> +	 * retrieved via a 'local-bd-address' NVMEM cell.

Why do we need a quirk here? Can't we always assume that if there is an
NVMEM cell, it contains a correct address, even if HCI command returned
a seemingly-sensible one?

> +	 *
> +	 * This quirk can be set before hci_register_dev is called or
> +	 * during the hdev->setup vendor callback.
> +	 */
> +	HCI_QUIRK_USE_BDADDR_NVMEM,
> +
> +	/* When this quirk is set, the Bluetooth Device Address provided by
> +	 * the 'local-bd-address' NVMEM is stored in big-endian order.
> +	 *
> +	 * This quirk can be set before hci_register_dev is called or
> +	 * during the hdev->setup vendor callback.
> +	 */
> +	HCI_QUIRK_BDADDR_NVMEM_BE,

Also, is this necessary? Are the devices which store the address in the
wrong format in the NVMEM?

> +
>  	/* When this quirk is set, the duplicate filtering during
>  	 * scanning is based on Bluetooth devices addresses. To allow
>  	 * RSSI based updates, restart scanning if needed.

-- 
With best wishes
Dmitry
