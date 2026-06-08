Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944E5367281
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 11:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919108; cv=pass; b=M1s9ZGFdIs3J08AbnmJCSqXtq2vEYOKeOgqmm0rAC/CxJtv3XTkt4LKuopSqG3zplAa2UKY1CB9P7TqlHMcpeDkf66g6p5ptpCqWDkQeR3fyXyphennZmhxrl0Jn2YgaAgbxBgiOi4SxXOEMDuknVRbbColFnQvkZ+iXkBdnHeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919108; c=relaxed/simple;
	bh=hhj8Vip6KRSgrU2uE5rO79Ldiak2Rlsg6Hs6C+XmYIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fNTrfw5o7g13EwD4xnw5MKZkjITutcpETtntNGhEW4ACd+aHWj38na4cw3MDsBb3DhmBgqUEobzlU/R7lk+FWGXf64m1651aR5SYOPdX5onI939eUskI9H3tKXzbp5i7JMd85i9Ym6B1vRwlD3sZKELWmHJP2sI6Gr0vXtihItk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gyjq1X81; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RcO5O9lG; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gyjq1X81";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RcO5O9lG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BC0N93487388
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 11:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pj8HGTOjIgEwJxXsqFpmeuzcGz93+i2/L//Hl7KmKx8=; b=gyjq1X81lQIRnvcO
	G1um2E6TV7hqmLL1Crrjwm5U2JX9LsLsEKMoBAB5r9dv+Re6mmmqF2N4BlWwnJWe
	WipwNPhnPDyTaQA1648cU+hTlv0M50/vvS6qQKzliDV+B0P+UasYAt4nGWww+/2V
	Jt2hVfesaJfjYeEx6LLpZB3Zd7kugW563Aw8AhYGU9FXuGT9sI2lmrgrxr4ipjYE
	RyrKH1rZFL3kTTJ+uQ3sF56wCseXRx5Ce/219eLO3wNRU5YKKduHHRQ7HWqC5dUT
	x7K2ybfU3hPnmKnk9GZzZSnL5s9fuvmjIHV2Ao63T44wc4jwbv7XlGhlcM4VQxJB
	Ow6dcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrfrfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 11:45:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157ae36434so133591385a.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 04:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780919105; cv=none;
        d=google.com; s=arc-20240605;
        b=HZGLwpDSrVtSVyvhQxWZgAaKtYF/0beJP69di14noJNbT4YXheCkkIrLnrPhMqvAiB
         Fp9IM+qiomarz4pbFopmDf/NDtJkBgKnzVEWKdF5r88ynLSHQ9OqeUwTFnGrHd7fiu0U
         dtZlt9NKNTMiz6m70lby7icoOfKijABlmdo5Ne7TcULZONDU6O49LQ91Hs8ET+i34z9/
         T96vpI1r/NjyVgYjhpzlirhCZkAM7NAydoP5rccWTyBX+5fY1hZu23JRfvmnxYz9mKTM
         ybR50HFJD2G7amKgPZ3EAVqciKtSe/JAcC9t7p6hnZtqrnnsPok3gB+lKuf9NwfcFf9v
         QWPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pj8HGTOjIgEwJxXsqFpmeuzcGz93+i2/L//Hl7KmKx8=;
        fh=nSJoXov2ec9G+LmH0iRxonDnjq2seSRqkYLqSgKPt7w=;
        b=YPHuAujQOdcrzFZS8YNsNJda+61BYFJkUvovSmt3DtX3CURWKSPQ3MlnOtJa4G99Yt
         7C1ySD0ajzANrWYw6vayNjYEROXraRGiJpKuWArQFuIqBJUtxMubUhNp2C7uLQML0yyr
         ZGNpeFVwfNJuq+2/sW6sHlclILjkx6ZJ8Adj/L/wQ9LXOwlAoGDXTBRFBayASxoEyuSj
         OTBMoYHoPLG+EIENpH99kk4elb8YzJxwF+jDhy36kIpbdSluNxVE1o7qvwyIsG+3JmBq
         RjSzD1b+DmWJ83UeN3xqKdrFxa7b+K3z4dNQp1ga5Yx652/ajZme/j03UM3KSfoQRxcp
         sqhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780919105; x=1781523905; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pj8HGTOjIgEwJxXsqFpmeuzcGz93+i2/L//Hl7KmKx8=;
        b=RcO5O9lGigUkcWBwngH5Wfra4pY3AIg683iEjDPu8iUitQvGL7OQVoChTSxOluDdJe
         +hSAORC1TWMgyB8XsS3ZAQFY7KgTWS5iYMxlK62hFqYhjc0ndnX9EaRRkcQijTqkY1r0
         YV1xsL0aKD023FfuillwZ3qcB9MvSonhseaSsiLWkScBlOaCA2s3mdI2kBvKree7hBwS
         zTCuF66jImfhEkiGIUv8P1cjypl2ziR+x80fXyxoz0Zm/Up+no+yC+OJn8FmtDHjGTql
         H6yt7tI8DTvpoPd8hNE1eRpZEjButzMMQak0CD/iP05MOo3AbN8OlKXglp+S8XyTSvw4
         wztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780919105; x=1781523905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pj8HGTOjIgEwJxXsqFpmeuzcGz93+i2/L//Hl7KmKx8=;
        b=NrlfIKf/jScbxRE+oYdjNuEhLr1PF2mXSKOw68ro/cp9JP60+dd8WLZuHbBg+N+ly6
         xiqFqXQmRJuDS+Vy9to7wzLW/DZnK9oVjgzoOyrann/okfeWUiKF7JPfG5EugoBZdLoA
         WDsJ+UihSefl3X5y+z3S82wMvimn5F05thq4ZYPNUhWBI4oGlwBNZjznyY71vaONhpij
         R4KDIS27pkB0aQZHmq9zI7eol6fMbQ60Kw21fn3SrVskDcyc/qxzGAK+4Oh2nVBV1kJz
         n6YAzFJ/5dF/eGWihZK+Fe46yxaL6HUvGa3VsgYuKRZlBxR4WI6ZTT5sdT8PzheB4VGl
         wxBg==
X-Forwarded-Encrypted: i=1; AFNElJ8G5/ofgDLZiHJjz2owI6tWTTYXqX1mRrS05jpWzZfQRiPzB4w5x6JnMCmX00tZfjg65o4me9vBdcsI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvi1reIeySGUN+Ld/ACGCcBkbfnB0Zhatw3w4ZJmPfZW9gwM4d
	7LU22knJEMoHMe4iddwiGw9duQ66XSYE8JZGcEzRwnYWhq8F2c8gccdIjoD/x7uKgAND1aMKzFn
	PBs6f/dlvFDVii6fruIu9xYOtITv68a8+a65UyJqbZ0tbFNqUAjHu51hQSHTE3lXsLet3mphd35
	ICrTbfbwyd7Uhq4UKBdlonM1c3xjdhzDCVTW4P/Ak=
X-Gm-Gg: Acq92OHJGP+j7P380P8fsZFxcMCOsIVvUAUWYp1xJQIVY8S07QlMvNMJAGo6QbjdcE7
	o2Rd1oJcxV/6cHTPNywQ+sdAM3HR2h47pxdfjpYQyb+pwicUyVSXN4lT7SySfQHQ+taoRGU/zHl
	UstEC7ALo9aEawUslvuodq/nB23Y9SxFX3raqMxYC8zuGckRcGskPYtXE8HCstyt6tsfu6zkhmW
	0gQ6MPJrsiLHhJl87Dx81hHIzHObcLRSEomJaGFzRKZGNMvXDnLFgxXUN73eHpFNew4SQ8bdSp3
	YgsQcdHZ2Gk78j346dviq8QyHs5uBLXd
X-Received: by 2002:a05:620a:170c:b0:915:8f76:8005 with SMTP id af79cd13be357-915a9dc9a4emr2367275785a.47.1780919104836;
        Mon, 08 Jun 2026 04:45:04 -0700 (PDT)
X-Received: by 2002:a05:620a:170c:b0:915:8f76:8005 with SMTP id
 af79cd13be357-915a9dc9a4emr2367267185a.47.1780919104401; Mon, 08 Jun 2026
 04:45:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
 <20260608-block-as-nvmem-v3-7-82681f50aa35@oss.qualcomm.com> <f528672e-ab4f-4844-bc7c-1f8f1c4dbd3d@oss.qualcomm.com>
In-Reply-To: <f528672e-ab4f-4844-bc7c-1f8f1c4dbd3d@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 13:44:53 +0200
X-Gm-Features: AVVi8CcIivK2P5dE8YRtSTP_9u8m9dGK-3gXU3su59C5FvR4dQPnW2soKiKG5MQ
Message-ID: <CAFEp6-0u1DBhXo9DCie5HCGTjcduWcHAiifVo88vFJwjYcjCog@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExMCBTYWx0ZWRfX0tElG3tyFrnG
 JCJtEtJsJDtPrSTsODlt4mnqcvbL9wVtCPeMkklCfzyxYFkGdnGXd+ZQkqs5htV8g2lCs6//pqa
 pSYknxm+jhp+Hhj/N4LH/MVRLr73STNeDu4PqUfZKH3yEw/cfJwaBTMkakWXfPwvQEGrlCdu0Ss
 00oeC/8CwjGxW5e2PaZI8Fp94Lk3To1BjjOEZsBYh+Fee43aCXl2x4/vB+s8yAwtwHgpVxoUZ8F
 yZIpt8cWX0OLiclkiQPVOnZVGi+kdXviCQ9QzHfVnOJAGrSZpg+wze5XyJ5fokSoHuc0qol7A90
 XjVqU39ouYIPVrjCwbSpudX62bBzqzZNW+L4PET54xdQXxr0kZG2TxaioAfjyIa2c44nDvNVA1w
 JOoF9TKLbx4qlJhxLkxzm5J9hfmLfUBD81O18+qmn9tZarYppYdzBnbv0JJ5oezsi0PUbaI1qE9
 FvgQGvyTS+Rv6R8J7Jw==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a26ab41 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=4LeufcCx7mgyzPUJGOcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: BU0myZHLlSUiheP_JGJ0GRQcQBpFzKkq
X-Proofpoint-ORIG-GUID: BU0myZHLlSUiheP_JGJ0GRQcQBpFzKkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080110

On Mon, Jun 8, 2026 at 1:29=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/8/26 12:50 PM, Loic Poulain wrote:
> > When the controller BD address is invalid (zero or default),
> > set the NVMEM quirks to allow retrieving the address from a
> > 'local-bd-address' NVMEM cell. The BD address is often stored
> > alongside the WiFi MAC address in big-endian format, so also
> > set the big-endian quirk.
> >
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 39 ++++++++++++++=
++++++++
> >  drivers/bluetooth/btqca.c                          |  5 ++-
>
> Squash mistake?

Indeed, thanks Konrad.
