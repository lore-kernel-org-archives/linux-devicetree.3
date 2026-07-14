Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FAE446838
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032314; cv=pass; b=HVz7SPMdCewBZV3ixaM2dS/bOBxpqBXCtz9IX4fDkPqJlq24iThC5mmbVn9/KhVGAsxyEUNsxdGXo8VuIfDpE5AlOaEkKp0+oUAtF+UkoWAy653sWUpItNNNjMffOuXqj0OkCNwLsa/a9+D30LccBrcFfuIFWYZeu0VvwaHSNOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032314; c=relaxed/simple;
	bh=ji3uIpmyKNhCWk9sN5ktVEemOSik2hw33b5vEOk3sQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIDDQUS6DYxQg+AXSdhXm/I4nAJiur3YNImn1UZ7OKCTLH3g7zJK7Aq6iwAciUC6yLYmPvwie2HiI7IrVJl1aXFDf/dTQIAJybpjjm44Uj9e0Ot1fv6YxqKKVFKx3dYWc0bxiuMaawG7WIxhojiwa1ZL8D4quGUo3+/Y3nKI2aY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pc0ZlMeE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIb2hTp9; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pc0ZlMeE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIb2hTp9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBmwug474588
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=; b=Pc0ZlMeE/Tc18FPN
	qe3RnE7NymV3SObOIc4FWc/ZMmsgt36U1cCl8yZUhYe7hZglmy8uhaTuB/s83WLL
	Kq/EvZEn+mmdnNSoFutGXKKBkqoB3Uv/jXvuBI0/yfLbHb66Ig9BvOd7EICXkRyr
	Db7oeuQkryAz6x4aGnDLAZXZrPJ7nPmQKWDcxLvuPyjFkVKK3SjAfC+hV1G9mVbd
	oOv/HjEKt4KPkVMfGzAH1ex/t//dsLNli7HfurHC+BUpDUS33YPd1js6RPv9rpwc
	+yhvdNhoIErbIlzzMeQJRzgNAcVWj9actgAwf0vlMRtNwA8AShY4G5sDGs95XVkg
	Hu2hEQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq054y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:31:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e934385db1so76338656d6.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784032302; cv=none;
        d=google.com; s=arc-20260327;
        b=Pghp81kgkYuWTCcigOtIjt0DbBlVAIHxkUzL9mWPgIelfpttGlhinyaGHfAVwBmcRl
         indLxw76qaGhenhg1PA4d4L4hzf3vXeMLtKrC5bYUrtctlQdl2cHksojWcasf60n5W1r
         bT05fG0ZGm+HMTYTgo931K2Yq1224FFGfsTplc1i8FS/rpMCW3zhrk49xZl4aFxMUDhR
         F4UsjbqeEMoC4lZrNg3mXo1cEAsZUU5/HR8WuNu+u0IhPMk5uxGw/WHcnYORbh8r0S6C
         zIWjCWSNf7uNHxVfYpWVfBjT4bEuICp2s8fv81hUW+6ucWlbhd0HdBJZaXUb5hEKVBEF
         ZMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=;
        fh=99Enku1AnyhqJFzeG2fi1GTkSHW3dBT7yHmAKRz1+as=;
        b=PFri9ZjF4O8VSjLjN9MVl9wWSeJt5Hu6CmaMwbmIQm+MKfg0YOc6lPPFu7Blq7aeSi
         yO0aYt6dpcAa6nLqLpuPFURWs0KuwEHhPuzQrGJTrgL8ft+phgScpSz/nKquw+sNRxSJ
         F7REGtpKe5zXH7h59Vayrt3KD9olo3Us1gkLoBAlgpft1JBhXGpbkv+iB9ph3hkCgQKg
         EoEG5vqVRUiafXzFjJ053Aan68/ZnlF+UkzPg1Ny/gANy938kHHL2te5WFZ0Jz2Hf7lW
         mUbwZbTnakiCjCIS94nrwy1npyCYYjCrXUdy+YqR55DcOmk4r1WjNspcNWRt3za8749a
         qlXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784032302; x=1784637102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=;
        b=CIb2hTp9sJ9LNPmkTS8PthiNnwWChroVR6yZEn7mgAn3TMVA1bNWGjhDx69l9L41Km
         GIBgFwiMvxh0oi1LmrU727+Y6mS8BPmVhdogTOBKwHxywhWbWWeD0u2sGfydrpw5Ltqg
         XnuPhL0CqSMKSdtYyFMJIxCBxJ/TuQPNKskm3lpn4fzWKLYpw4+UsWfTVA1HVIz5dDNo
         EUTgv4StgM/GC5AP0dk9F9++hqgAdCUWLYD0cCaxGRj955KvTZb9WqBgp2IVC3hwKrqM
         +Mj78sEcOWFPOxLJk/KMpJ1q8h7iSVgT6V/NeSmhfcM7eaRriVLa8YUQbbww1hMIsO3p
         V0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032302; x=1784637102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=;
        b=mITXC31TzjEE+gWc9u/i1294ZfN+7d5t1LnNIbP+SFAyhH5o6P5i8ZePu1ioM4LAuo
         ijHccLLvkXG3OSHGSXCgzrkbfWS0zzeH/c16QNBF/ZvDmFGi0HBVxxX5qVvNSZIJAQi7
         fm0gmuHllRhxTVaYIuVIDBDAXJWeHZJp98hyM8jt8Khji+6K8RozVDJgiru5pxWaLGjx
         x1gHHyXmhd1JK8fpWVJuP3QZwW/j1SCTODhKxEu8DlpWifkNSJ+Nhh7k5gyYRSoA44ns
         xF/6vpxgb4uBaHoVcFnGdaAM98+BhEKQpClkpH6g+NfhN7E9XHFpKqOrzB0qjElwgien
         QUGw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0T7T2Zd04KQMjPrhQaKmYb1DIlmiym2njvVTcPZI3QtE1OVdwxXzKdbtOyQOMJIA5nYEWgGymqEJY@vger.kernel.org
X-Gm-Message-State: AOJu0YykSlisUAC6040b3VUtL5dh9zp91BqrC5LcBDMre1eVSiYa2nMj
	9W1oszo0zB0WnylJCEXyh9Mc1Ucm8E7PliUSDQiPSAybIytGdc7dtW4hPZxw+qp9FHmK9drD/9u
	25cj0hykhgzEFKdvDX7PJeFQRIWP0aM4b5ENcvfFcecY4wVOtpWxFYZbVX46CTwHXMmPGJn7INi
	je40Eghk9nYTfB9hExDrfP3CcNXCIueAvrJMB+Zj0=
X-Gm-Gg: AfdE7cl10ke8fIyljpVqGBDsZ5Z0VSw6rITh7DnsFkvkCKQ/wawHUJUz2Fy3hCcuytY
	ApnZSDmrPBsnnKHL3GuTEtlfAyeCISogoYvA72lIrP3Uuegi38b5JsOcqQkmRqTU8Klj1qtXkV1
	H+brDHHgmSnOxYBvzssmgEnFMgTWj6HCf8oZBKr6TLAXUVggHOoM9aao22UQFanITjO8HN
X-Received: by 2002:a05:6214:3385:b0:8fd:6e12:9710 with SMTP id 6a1803df08f44-90747d1cbf4mr35409236d6.62.1784032302406;
        Tue, 14 Jul 2026 05:31:42 -0700 (PDT)
X-Received: by 2002:a05:6214:3385:b0:8fd:6e12:9710 with SMTP id
 6a1803df08f44-90747d1cbf4mr35408856d6.62.1784032302033; Tue, 14 Jul 2026
 05:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <fce1aa52b181082f260a824fe38baf033ba8f56e.1783505329.git.geert+renesas@glider.be>
In-Reply-To: <fce1aa52b181082f260a824fe38baf033ba8f56e.1783505329.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 14:31:30 +0200
X-Gm-Features: AUfX_mw1w9aani-kekqL_J3mlM9LGY41ZFq3mfPK3ex6sNHNGM7Yu8pRBTDGFLI
Message-ID: <CAPx+jO8W3MdqnJ-4EgbmFvODuX9BGcyww=YRn=_CknohfSWOjw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] pmdomain: Make genpd_get_from_provider() public
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a562c2f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=BvHvEDz1nzgFWKTw3gwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: xzYup0AkgiyfP2CzgEvDQJC-u8s-XJIX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzMCBTYWx0ZWRfX6attAvvjK87b
 D10eNA/P4CCjSO3tTTN5AwVVQalqQoMc07lpt8wo7WeLszHKuGkYzAMwZPCScSkNlTQQ+9jQ7y/
 X9uNm6qibmEk7Mjbih5/bcLSOFGFLK8d5j6gi4y+4Dn7BteC34ess4Srdns+zA282leX20cMWIA
 1TwoaQD0EqQnuoUhNn1BNmX6Q385CW05crzZPnIJ9sRo5C2FdnsQtZrP6diltQV2sDDlYxIFCf2
 IzekWj0HBtdRTBn72Zub7nlt1pqQoJ632Ah9RkQrFjYHPBBF/EcR7BCz12o36L5+6SLiUwyGesd
 J9KBjj82wGbSzCgmmaR9PlqDBSUaNllS+AF/d9yKPE4ImK9284nxR4LAc1J6nPzSrC+2M3B1qcW
 cVRqKmWGQt+xV9Phm0QJUXxHFLtbrGRFsjCCHBS++TkEEdLQ6jBCbU2xL/NOr4Qb4Jfz4PiuSQz
 4poBJ1yQAng8gEQ1row==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzMCBTYWx0ZWRfX7m6cWwsY1M5h
 c2zk9XkALV1CwumWDVlXcYOmonMHO2fn2Cd3qBxy2U53eK9MPPc/IIMz9J0x/g3hNstbMBO9BLr
 gxJQUSlXZJichjgrd7xb7T6iZHSMOYU=
X-Proofpoint-ORIG-GUID: xzYup0AkgiyfP2CzgEvDQJC-u8s-XJIX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140130

On Wed, Jul 8, 2026 at 12:17=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike the corresponding function in the clock subsystem
> (of_clk_get_from_provider()), genpd_get_from_provider() is private, and
> thus cannot be used by PM Domain drivers.
>
> Make it public, so it be used by the R-Car X5H Module Controller driver.

I am a bit reluctant to make it public, because of potential abuse.
Moreover, there is no protection or reference counting of the genpd
that is returned, hence the caller needs to be careful.

That said, if there is a strong argument that it's really needed, I am
fine with it.

>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - No changes.
> ---
>  drivers/pmdomain/core.c   | 4 ++--
>  include/linux/pm_domain.h | 7 +++++++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e290677c..7de3c693ddd9a2c8 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2900,8 +2900,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>   * Returns a valid pointer to struct generic_pm_domain on success or ERR=
_PTR()
>   * on failure.
>   */
> -static struct generic_pm_domain *genpd_get_from_provider(
> -                                       const struct of_phandle_args *gen=
pdspec)
> +struct generic_pm_domain *genpd_get_from_provider(const struct of_phandl=
e_args *genpdspec)

If we are going to do this, please add "of_" as prefix for the
function to have consistent names of public genpd functions.

>  {
>         struct generic_pm_domain *genpd =3D ERR_PTR(-ENOENT);
>         struct of_genpd_provider *provider;
> @@ -2923,6 +2922,7 @@ static struct generic_pm_domain *genpd_get_from_pro=
vider(
>
>         return genpd;
>  }
> +EXPORT_SYMBOL_GPL(genpd_get_from_provider);
>
>  /**
>   * of_genpd_add_child_ids() - Parse power-domains-child-ids property
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index f925614aebdbc914..95fd7e63e87e2095 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -458,6 +458,7 @@ int of_genpd_add_provider_simple(struct device_node *=
np,
>  int of_genpd_add_provider_onecell(struct device_node *np,
>                                   struct genpd_onecell_data *data);
>  void of_genpd_del_provider(struct device_node *np);
> +struct generic_pm_domain *genpd_get_from_provider(const struct of_phandl=
e_args *genpdspec);
>  int of_genpd_add_device(const struct of_phandle_args *args, struct devic=
e *dev);
>  int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
>                            const struct of_phandle_args *subdomain_spec);
> @@ -492,6 +493,12 @@ static inline int of_genpd_add_provider_onecell(stru=
ct device_node *np,
>
>  static inline void of_genpd_del_provider(struct device_node *np) {}
>
> +static inline struct generic_pm_domain *genpd_get_from_provider(
> +                               const struct of_phandle_args *genpdspec)
> +{
> +       return ERR_PTR(-ENODEV);
> +}
> +
>  static inline int of_genpd_add_device(const struct of_phandle_args *args=
,
>                                       struct device *dev)
>  {
> --
> 2.43.0
>

Kind regards
Uffe
