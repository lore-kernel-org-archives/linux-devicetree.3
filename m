Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793013948;
	b=Kd9m5I56N2FQ8SYKZmv6yY6kEH6gsKvyI7s3OJjYNLKDXTIY/xHm3KBjvrTcH0welrNw
	 lvDQ0TmHITM90dNQvF3B4pmHiABWTxjHL9os3KrUXxYmb16YKp/zzDLnOGLAZDyWykAy5
	 lGCQXobDU1gvfEdb70S87B5N+7ZKpNN0rUII3H/gsHrHxxPawi4XD24B/i0LQhzZEqJUI
	 /OH5ddXFVmEvWxEFbxhFxjmL8UC45g1XzSi5dNEPV/gBoUyouu9phiNVveyg/VqgFbhX8
	 zlOhTvGYlR8OwzDnDkqw4vSwEZwtSKVtrUzTRzoCPA9FBKP5/gij0mB05ipGPBIc06A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013948;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=;
	b=3J5+3zNbivPmoOXePZx+vaPBfH9efTDWD7Bwtxm5FhpDXRj73IDKBaJ0598fwbK63StL
	 ApZjZaSXl8ljaUYjWp9GoxfKu5/++BQKrhs7BnPlnNaMbusETCWumXCVS8SdwDM7VdSIF
	 zZyEZQZ7MKqgXeOFtnKQ8iQlQJfzw20xVErbo4h8RI9yMdxu3segNUdYrN12Z9Y2uJhfI
	 q1YPAzhJBBCoXbaWPVV/RPupiQPWomnVdwQcd1ZwVKZPzBrgRZjujKmUrFlR0diW6EMdV
	 g65O1/nx7C78I0c5MUJRlrZeSNBCNnvzwduDZIFzDjBMqjvHoGs0jXiwxqcSUPd+Y+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dnEBl84P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AOUsYe6B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36456606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36456606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dnEBl84P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AOUsYe6B
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9jT3049859
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=; b=dnEBl84PS75rsH+m
	t8WJ81u2wB65Nq2f6dOZLiSzrRzUKj9Pyzz3f2MND7GXZofF94QSfPq6MViMHQBq
	bSksoKo1Y38NbJHZz1v6vnCKdVCH70IYmaV0Umc8+BS+KcjIdEcJfBQ+4MEMozog
	o+2Ym5XwBrdsZDjk/RqWosjsWX5+LEAvltQ8WhhU5dARfQE23oIebl5uYuWOWQTA
	em6gk0bD2HUH9s1AEODOEAXwpQeH600P0hHKdXLJEuXnKFdhGr3hHruBA9KPExlr
	TdUGU4BwIYnoJZYFsYqTPOXVafySOKY3NF+LOeofxcYziPiLyE4e4WNY0W/SMTdy
	RXQfVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9vxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:25:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f62934ef6so368387485a.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 04:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793013946; cv=none;
        d=google.com; s=arc-20260327;
        b=VIhgenCIeUA/9ZNdGZqFgsb5PL1SCyQuUr9DCQZYVK3lg5ClIL12nGPd6PakeAMkqB
         jjK5aB4hKXAQD+MDm0wpLxtLvsOgiUV46Cb1cg46hJE+lZ8+izezyvq5UVTeRGCCAPbb
         RLfaIwsE4vru8UpPz9dGs8+LXzf4ZhLS+tu8H5yBmnwZ7xdfllJ6jAxyEA8bPm6y38rL
         CzlR2AlY6ezbX6ZV/jgdsQ3dFVKgXENC8X1Ob1DQW6TiODJ1RIThPm4zSUJPicTWGIRc
         A0Op/PmX8WSCFMFG+7VvPz/IQPnHCjBy75JriDP8ogMAeEYOdu7o9Je+YjroQ6c6REO+
         4SrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=;
        fh=hJ98vRWQayCGhapI6nP0ykIKKHroZLjqGb+EO+jbsBI=;
        b=bnBCPAhIYUEQXG6g6uobPfMoCdVCeY+wsNrBj9easEoUHMQaMTk0o1ZF/mbSnrYHBN
         oa/V1bN2CuVn5Kn4ZaZG54YbwZCLftLgAYepXU4BI5XyGS3EcC6y+WxljrabzYE0z0ao
         Cd+rXOJc34o0jpLMYwyPVw4RGEPVIf7bMfWFepD6eKoRJxReG7XkQI5i3OIJ4xglLAXx
         IUzh7YU3Z8jrQTZYZY3GsEn/mcL8LVytbXo1G/UZIiE3VSlNUcvPsTHMUpfH0YtnfVeU
         et5zK+crEjqR91euhzwxlE+7IKatKiWQC7WDT7Ehfg+saytAXUNGO+3GxRlDAPHH89NZ
         0PCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013946; x=1793618746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=;
        b=AOUsYe6B+tr9jcb3Y3bSQ5SEIWG76vCozA59tpwZxg092fJzIqAxkcCUSVlDqSYdCO
         3Le7sTlWyrekQILLlyBHm293aJJPUOsYXa5GN68/u3NMlHiz72LGybgN0HCXolEyTGyc
         p7d4AoArT92bflVqszORm8S9ZRun6tLHK6068JH77owtZRnU+/OnIbXv5Ffcb+3EOepp
         p8lwoK5E5XDSzbFqwIMP2S1IRRCwfO9TRCXW/CN354BYSeFB5Gjqo2CLgCoVEnl0TOMw
         1CoibTH/0+emlPhAqjdlgPH5TDlAuAx8am3rdm+OhbUjDQFSpYM+6VzfuNJj3VxUhuy9
         cJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013946; x=1793618746;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=;
        b=s2PPLW/qhHNEKfHDudCzIZDURUmKFm17Z94trI+w97LQvxHdwqpky8iiBEN2s/inLw
         v2GzOsaMBKEaWOvRyW4+FuEbvk3njYIXcY2Axhx1avIRWY5ps567zUhrwkRlrTCg4X6y
         y8MooZ0B997va/ftAkfu2NGz9W0fbIbi5/V+4cN/aHK0u+iMZ40eWuSIOId+Bv8PFZ7E
         1tAFuGooJJfOU0iFleXF2w1TEXwqZngPKcSCAYv4zMK9B/72dLGFcx1fNNmnWCJ5StNz
         lOgEnxamHjCCVbPiWCrn4PzHqkF7jINNnANN7JmSuoUsa8PKjocRvZtAIgpO1HxMZ0Ji
         QHSw==
X-Forwarded-Encrypted: i=1; AKwUvByhxiE28mCWLK+ptCgEv7WFkpzjcRyV0zbR/CuU/QFW9eUkW4g/gMzLZZaiQ2PdCg/P0eG5/Nnn97QP@vger.kernel.org
X-Gm-Message-State: AFq9FYLmlu9OIlNfyeLJf5CuLZFdNXukL0l04rzlllWaYt/l8lsrGKgb
	TEXqsnqojJPKojVcrHjcU0r28j5jfHmprjXrmT7GhDAk6hiL0u75kBd+UJGNpopGmRHcRyMeSIr
	5bEdDHa5nOzmEWJToB1JhFpWby2zlq7K0qmJ1CkOir79h7f0l/GlsNpge2oJnQC1vucbBsPY7ml
	6LjqKOBLfiTNywBpda3Ou75ojQvE7Vyay1vWZWjlE=
X-Gm-Gg: AYBFou1as1F8y7i1bH3ITKbnuHnaWLyc22hjGj0rFuOwcaDWzzcJcbKHlW881HFeE7a
	z3+ahI2Jj0V9ZOyi2TPX6xdUCjnJ09474FuEdxS4EWohZByMmRzCICnD1UyHtOV/oljdvFwfATb
	bZNIYTydW4mR4gCGBXCpkdgmpvjSoP9cUYDarO1BQCcDsUIjHGz9wMeWpvWdn3cz/r2z4viMNdS
	PyRMCTMXJLxUNNi1kuBVNV3K4aOYzjd+RW/dWn0y9LVMZQJVW1nE5w/T5Y0nb/gu7DquwnOeCJy
X-Received: by 2002:a05:620a:178b:b0:93f:26d6:d70b with SMTP id af79cd13be357-940ef8af1a0mr924706585a.29.1793013946395;
        Mon, 26 Oct 2026 04:25:46 -0700 (PDT)
X-Received: by 2002:a05:620a:178b:b0:93f:26d6:d70b with SMTP id
 af79cd13be357-940ef8af1a0mr924701085a.29.1793013945915; Mon, 26 Oct 2026
 04:25:45 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com> <20261014-b4-nvmem-efivar-v1-3-187c85f65018@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-3-187c85f65018@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:25:34 +0100
X-Gm-Features: AclHuK_V9TSwenazx_QbQTVJlNkn-z_z7PltZHh3vUhKfg_kBmr_W8aabFtQzwU
Message-ID: <CAFEp6-2akDevVekLozzaH1e7rNuqqfpHjQiQvSkwuv_4zLucjw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/5] Bluetooth: hci_qca: Support BD address from an
 nvmem cell
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: W5zAiQdpy03vL3143wHNu-Sz_ccoz7Zj
X-Proofpoint-GUID: W5zAiQdpy03vL3143wHNu-Sz_ccoz7Zj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX28lSYZUZEPZ9
 /tfVvu41fh1FKyD+GMK0uT0/VuI10XkHjOUoJpHQT00qKEYVF3uMC/J95unHEeCa0bVqy/SGftA
 T3ziVKGfv4a2QuKvUXHbxSSlah1pHDw1x++c/HSKLF09iulyMihV8Ysdl5RgITyxeY3kIHZHL/6
 QruuIff+gA3ZtXgS34DT7yxTGiEYsrgy1BoBCH7LxuuK7FzsiOwQU7rJOOlOsXVNFc+4R2ovgdU
 fO/5uYDVAJdyIKvNMttloaL8+7qNlgzwWMz9d2U0oFfByzKCx5a6b7DNGoZPAZXsVhHhsCyof0g
 BI7JGfaqZeRfx2kCJjb2SKa1llL3Z80IyfwZMzhI9jqFtKjj42/t9VHp8KZrjVOxJYvk1TuKNOM
 AgKjzWE3iL61/4P9hJ/e2w1eBJpGbrAQcjGddO+pF8esjFwfi4CmRIfGBtqZ6c3TJRfaT4FoAwo
 fT4Fo1P7/Is4KmVdHDg==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf38bb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=v5oHNKCaMdnEZ5eDWvYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX3JnofcQGMPrI
 F0IQvYVSiDpGhSp+L/8S4z8KgDrO1MFqqM3Pk9bHxTj3v0aYbZSZPxnN8U6g/STTbw+nU1Xq4RH
 LuSL8OnNcZzX5anHlTFUEJ0uVXzZ3Sg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Hi Abel,

On Wed, Oct 14, 2026 at 3:05=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> Read an optional Bluetooth device address from an nvmem cell named
> "bd-address" (as already supported by hci_ll), and program it into the
> controller during setup. This lets QCA controllers source their BD_ADDR
> from firmware-provisioned storage such as a UEFI variable exposed via
> nvmem. An all-zero value is ignored, so unprovisioned storage leaves
> the controller default address untouched.

I proposed a similar solution here, at bluetooth core level:
https://lore.kernel.org/all/20261015-block-as-nvmem-v11-5-f890ac74f87d@oss.=
qualcomm.com/

Regards,
Loic


>
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 48 +++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 7089e9b639b2..b704f4c3e1a4 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -25,6 +25,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/nvmem-consumer.h>
>  #include <linux/acpi.h>
>  #include <linux/platform_device.h>
>  #include <linux/pwrseq/consumer.h>
> @@ -230,6 +231,8 @@ struct qca_serdev {
>         bool bdaddr_property_broken;
>         bool support_hfp_hw_offload;
>         const char *firmware_name[2];
> +       bdaddr_t bdaddr;
> +       bool bdaddr_valid;
>  };
>
>  static int qca_regulator_enable(struct qca_serdev *qcadev);
> @@ -2079,6 +2082,16 @@ static int qca_setup(struct hci_uart *hu)
>         else
>                 hu->hdev->set_bdaddr =3D qca_set_bdaddr;
>
> +       /* Program a BD address sourced from an nvmem cell, if provided. =
*/
> +       if (qcadev && qcadev->bdaddr_valid) {
> +               int berr =3D hu->hdev->set_bdaddr(hdev, &qcadev->bdaddr);
> +
> +               if (berr)
> +                       bt_dev_warn(hdev, "Failed to set nvmem bd-address=
: %d", berr);
> +               else
> +                       bt_dev_info(hdev, "Set bd-address %pMR from nvmem=
", &qcadev->bdaddr);
> +       }
> +
>         if (qcadev && qcadev->support_hfp_hw_offload)
>                 qca_configure_hfp_offload(hdev);
>
> @@ -2420,6 +2433,41 @@ static int qca_serdev_probe(struct serdev_device *=
serdev)
>         qcadev->bdaddr_property_broken =3D device_property_read_bool(&ser=
dev->dev,
>                         "qcom,local-bd-address-broken");
>
> +       /* Optional BD address from an nvmem cell (e.g. a UEFI variable).=
 */
> +       {
> +               struct nvmem_cell *cell;
> +
> +               cell =3D nvmem_cell_get(&serdev->dev, "bd-address");
> +               if (IS_ERR(cell)) {
> +                       err =3D PTR_ERR(cell);
> +                       if (err =3D=3D -EPROBE_DEFER)
> +                               return err;
> +                       /* -ENOENT/-ENOSYS: no cell configured, ignore. *=
/
> +               } else {
> +                       size_t clen;
> +                       void *cdata =3D nvmem_cell_read(cell, &clen);
> +
> +                       nvmem_cell_put(cell);
> +                       if (!IS_ERR(cdata)) {
> +                               /*
> +                                * Ignore an all-zero address: the backin=
g
> +                                * storage has not been provisioned.
> +                                */
> +                               if (clen =3D=3D sizeof(bdaddr_t) &&
> +                                   bacmp(cdata, BDADDR_ANY)) {
> +                                       /*
> +                                        * Per the device tree bindings t=
he nvmem
> +                                        * value is MSB first, while bdad=
dr_t is
> +                                        * LSB first.
> +                                        */
> +                                       baswap(&qcadev->bdaddr, cdata);
> +                                       qcadev->bdaddr_valid =3D true;
> +                               }
> +                               kfree(cdata);
> +                       }
> +               }
> +       }
> +
>         if (data)
>                 qcadev->btsoc_type =3D data->soc_type;
>         else
>
> --
> 2.54.0
>
>
