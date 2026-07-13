Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3122381EA4
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940791; cv=pass; b=j//VqbYYGI/TOukdXsNdx+97X67+IWvcx+jUN5gDdtmV/arNvBIzDVY52PykdhTd+WzunaPpcHFyBsBKArmtRKj5S2OZZ4eyTaZTentLp/54Dx+mD3AWXNx8LTHtVLzpo+GVtgdtpHrjrkcevTuv1S7xs+zfZLpUtIA+wbTMOxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940791; c=relaxed/simple;
	bh=HR1lapqH+OZ1Quo0OCHQTCSA/dQih1hL2H18hq1e3Ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6xYDm80pKIjkicgmB+64dbKPSL5arxEbksH/IYK3WmnX6RJ+rIGeDKpBq0ks2aIW5F9zH2Ykv4BNUFPgozsoimQd2ltmb8znTyxCdtXtYjUMthc3ylKw3aUzb5Md8aozMI77o3zHk4yqNWdbKXkEl1kDYjSQy91nzk+KIxgBs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=POfeYPT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTSMlVGq; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="POfeYPT3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTSMlVGq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9R9ft1122963
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2l0IvC+7wRYIHM8yNvt5mCgju1bnSM1YrVh4Np4UJRI=; b=POfeYPT3dzNfdjee
	A84jGjN1sVyE60R9docOEG6CKA+i3aSsV77vJ/HjIvIqPcI3KRtTELpLtLxBya+h
	J9kr0fQEwu7cPqSZuD8Ikr6/hFeIamQbz4JHT7LAGVOMDgsQ31bxIette34iVllm
	zNYnHppxsoibB0HRoUz9cKB2NEAtwiRaIz4S3jXQFDztfHhI3j6rwopYoeV2ZRFw
	8ug7p+nTWUL+XXKtpHLkGlrEWUbXP6/JU2GGjYzONYud58dbEWYT3ckYPxWsC1V9
	q2cSReK66b5Jr3AOjE5ZDfCYhoUYTy+KjFkbFForQVrW3a4miLY+eD6GyUkhO/R7
	jDoGrw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda0bcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:06:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0f0a0760so67189451cf.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783940788; cv=none;
        d=google.com; s=arc-20260327;
        b=Rw0ZgPbdvsSFQdXN2tXkgC9wFE9OKTc0XehBakvzNsnhlUuJE3s2IK5Vu1Xj7KglLW
         LM6PEkIPXWiy87ogkFRoaplU7t1liydDYd0MGD6UQ77v4OMEsN0PpFhbNVItxZXS1Cvk
         gJZMT+PlsKWupAumrEgJgoApAMtwntqH6SaihjI4eT4EeL/u2oIPDWQqsih5AtDRlNlE
         l0LH1mKFv4vV95qIefC9plEQpG1sowSeNSRs5Cirhr9P7tD6SvnUiCmiauZcu6W0fVZ7
         NfCtcYkhXV2ff0H2Y2CRWyPHukXcsLFN8f4ilMN7QdPpCw76M4hwAiDbzAoRhfbU7ZDh
         mZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2l0IvC+7wRYIHM8yNvt5mCgju1bnSM1YrVh4Np4UJRI=;
        fh=mNl0pXmeajxnPBEZIU4SF2QGNuqZse4J9cCACS3Zh60=;
        b=GQgyLJmQf9R9JeaSfM4pfkuSeCzvQ+R/1S+GwnCgKIkD4Sl80v7DYEqpsUo59OsTQD
         c0nnZA0eCse1WkvgGGHc+BuU1RHWXdsbUQTiGOlYqf0vlc0gyKHKmrEU0L06kIIdixGy
         50hQcPqD/rz2bg6LWzlB0D8ahCXZJW688OH7OedngRvuCBekGJUH1cwOyQc27YEw5apQ
         iQjN636NxGS9mokh8MM1bZiZc6ot703cOHVQWYp4nshbF2TMo4kzOFQpdKRFgt8O+JHV
         T8iPjFlAzVDgnVCbdqWhGkV3/AO8+IxjOy8XPmKUhL7NNiG/vspVe6NjDL5V0WRDDMmM
         JLvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940788; x=1784545588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2l0IvC+7wRYIHM8yNvt5mCgju1bnSM1YrVh4Np4UJRI=;
        b=KTSMlVGqt5mj/bMJDz8BWfwOOyZtch67FvOH7THc3Ax2MP+No3zHkYSiTv/QNNckrC
         NlJ8lA669wTwWnHBNgOXrKEYxddmRz7o1hu40knBuqxMO8iZj39lFJK4RK0GiR5KZbL9
         TPTD4hIWgGWM5xm0T+ne5hHLMdEbh4vq3mnNEXycR5aujZ9fDjApjWkweay60jUS9SPQ
         8cXaGARFD0bhh6n8SQH3lPac1SsJdZAMrNzgAzuhBpAfvjavPhz4WhrBOAxXNdHj2Ok7
         4140lYt3L9Ux51LknU8A4lgnsUWDYJsBIUNTbCWvf0Z5Nxz4LiFhbAeD5f40dczqpC0W
         efqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940788; x=1784545588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2l0IvC+7wRYIHM8yNvt5mCgju1bnSM1YrVh4Np4UJRI=;
        b=oM1DfZchKyjthznpRk+ShjjViHbLqDGJo9Ald7Ij7gK65bW65HXAFwyAEhDLcH3rBT
         4kIj6mAOAmn5abdq/R5417v4vRYOquyaT+ZOjD9TwhXlhBesxiszoONDh0alb28BiuxM
         ho6A5Sl6k9+XltNzMR2oxzQkL+8XLTJt5bCrqwXTQQhVecn6HF5Dj704D2tPFT0N+HBH
         T/jrokESbUwNVfis9GAY/nnVT4L2uXcf4S51W26BYMIQ9FFEAdbjZPoYePwvHFLpOeII
         DllMVQaJo0ErPvbAjGHQc+nzBPAATpJhs1TZsbWmQDr79r89BmYqj3pZJm7lKtwr0yqC
         d3Vg==
X-Forwarded-Encrypted: i=1; AHgh+Rp15lDtCW3BZP2f+qaUZ/fFJNmCMu5JMEInlH3RtOZaYaNFdyTNZyPfLkSBisqWHMeM52k4HH6wHKnR@vger.kernel.org
X-Gm-Message-State: AOJu0YxZrZL3K07Gb3d+V4Gb0LFLH4oIc9XiMR6xmXgq7SHb4ZhDY+d3
	KkykMuywKwRXvmFm1UjYwlWuaBO/mird2P7EiFYmfWrzrv99WY793iCxgTPkUCUmuF/nPC8kpTq
	K4JRYFtISZ2lqEEvBnW79cV2cK78KY0x8OWxo7+EBf4aNrFTcwQM3R3oS/ivOP8yKvjsVa5RPld
	zcT93572itm9EyXzp3Lg18DJasYjKvdkvn/m486GVmOYEw2R8=
X-Gm-Gg: AfdE7cnl3KM7kEcj37nYadi2Ijjj2zKFnAXlLhD0wgGUYVKpNYhpFXs0OBHoi/5va1R
	wb2xJLLbHON1JhiaNaqvkDOIxC1zzDhRdz5xtemXRvHLQnXfX4amHMGIa13w7kZ95d98MkgE/8/
	j4O5vPru+sDj7W1sISSHpyQVLV+JDyvArSao5P9bR2oV8sqXFbsdNRfxXfau2+tLAhMlm6
X-Received: by 2002:a05:622a:a587:b0:51a:8c9a:8fa9 with SMTP id d75a77b69052e-51cbf2ce4bfmr86919961cf.58.1783940788038;
        Mon, 13 Jul 2026 04:06:28 -0700 (PDT)
X-Received: by 2002:a05:622a:a587:b0:51a:8c9a:8fa9 with SMTP id
 d75a77b69052e-51cbf2ce4bfmr86919621cf.58.1783940787515; Mon, 13 Jul 2026
 04:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com> <20260709084635.24912-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260709084635.24912-3-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:06:16 +0200
X-Gm-Features: AUfX_mxflP0lESSPqjO-mD1cf2nnww1_fwPNQR52YPdL25avy66WeDOCLfhgEZ4
Message-ID: <CAPx+jO_CAWoNtW88OBroUxTWCXz0SKH3c0uPM2vJYSR65xdMKA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pmdomain: mediatek: Fix possible nullptr KP in HWV cleanup/on-check
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        matthias.bgg@gmail.com, nfraprado@collabora.com,
        irving-ch.lin@mediatek.com, macpaul.lin@mediatek.com,
        aford173@gmail.com, mbrugger@suse.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, justin.yeh@mediatek.com,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX4lceT1LiO4z1
 J99++NDqLxnmz2XVSIL54wy1X8vGxOSJ1OeanP1e63PH3+AQgHBTIfpIQKJziw09Rh1Y8E3LYz2
 l1XROfBOkIK4Nq+UhodfsW5G5iNO+Mg=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a54c6b4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=QX4gbG5DAAAA:8 a=Z1TsUI5AZlo4e0OQKm0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: vC7ZSA5LUMU7NCLRXuw_GXt53Jv-v0bu
X-Proofpoint-ORIG-GUID: vC7ZSA5LUMU7NCLRXuw_GXt53Jv-v0bu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX5T7UWakuAc9p
 5aUiQfGeaFEGfuyesr8tAnhudzr2WQcOrflmVL1MCHAvdGgi693G7V2P/rg08+FRUO4kwpmR2Lo
 29bxe2Ig7269zQp9AQm1fOQe3x+G8aEQYEI35rgg5/xQImgiSgStV78SBVrccw+DiV7uI6UasIp
 UMRfdhuqfHBHMT3TYXXY1nH+1+9FHLnvVgQWuUXU7vLWQ7WL88ecKBUz8Zmsf7dbT1aPoYuZk3p
 ZMtW8CdzyaS2VnH9Yt032bVXn+qfw8TFE4Q7p2e7+PwSpbsaVIpxQKorbtCpQKbSmVL6y0IIFT9
 06g8+bHhiO0QupCObA6FfNKerxjUnuL1jVjIBVm50G3fULiWaDkWxWjluv3XRkiwc13IDGatvxq
 TcTh38T1WquggJMO3Dv6TMP4FVcpNb9baWI/s4C1zEyYrrfm+xa4BTeLmV7JR62JG2PEvX5ogJJ
 YKIhj2n6zRRFYaxYDTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130115

On Thu, Jul 9, 2026 at 10:46=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Should probe fail for HW_VOTER type power domains, this driver was
> unconditionally trying to perform cleanup for DIRECT_CTL domains,
> but only after checking if the target domain is powered on... with
> the DIRECT_CTL scpsys_domain_is_on() code again.
>
> And there's more: the scpsys_domain_is_on() function is also being
> unconditionally used in the probe path, for any power domain that
> has flag MTK_SCPD_KEEP_DEFAULT_OFF!
>
> This bug was never experienced by anyone because the HWV domains
> never failed probe, and because none of those is declared with the
> aforementioned flag - but it's still something critical.
>
> In order to fix this, add a check for MTCMOS Type and, based on
> that, call the correct functions for an "is on" check, and also
> do the same for the cleanup path, calling the correct functions
> for the "power off" action.
>
> For the latter, since there's a call to pm_genpd_remove() right
> before calling power_off, be cautious and add a variation of the
> power off functions (with a _internal suffix) for those to get a
> pointer to scpsys_domain instead of one to generic_pm_domain as,
> even if that's still working, this is way too much fragile and
> would break at some point.
>
> Fixes: 88914db077b6 ("pmdomain: mediatek: Add support for Hardware Voter =
power domains")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 40 ++++++++++++++++++----
>  1 file changed, 33 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index e1cfd4223473..f0a6339affd7 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -393,9 +393,8 @@ static int scpsys_hwv_power_on(struct generic_pm_doma=
in *genpd)
>         return ret;
>  };
>
> -static int scpsys_hwv_power_off(struct generic_pm_domain *genpd)
> +static int scpsys_hwv_power_off_internal(struct scpsys_domain *pd)
>  {
> -       struct scpsys_domain *pd =3D container_of(genpd, struct scpsys_do=
main, genpd);
>         const struct scpsys_hwv_domain_data *hwv =3D pd->hwv_data;
>         struct scpsys *scpsys =3D pd->scpsys;
>         u32 val;
> @@ -464,6 +463,13 @@ static int scpsys_hwv_power_off(struct generic_pm_do=
main *genpd)
>         return ret;
>  };
>
> +static int scpsys_hwv_power_off(struct generic_pm_domain *genpd)
> +{
> +       struct scpsys_domain *pd =3D container_of(genpd, struct scpsys_do=
main, genpd);
> +
> +       return scpsys_hwv_power_off_internal(pd);
> +}
> +
>  static int scpsys_ctl_pwrseq_on(struct scpsys_domain *pd)
>  {
>         struct scpsys *scpsys =3D pd->scpsys;
> @@ -694,9 +700,8 @@ static int scpsys_power_on(struct generic_pm_domain *=
genpd)
>         return ret;
>  }
>
> -static int scpsys_power_off(struct generic_pm_domain *genpd)
> +static int scpsys_power_off_internal(struct scpsys_domain *pd)
>  {
> -       struct scpsys_domain *pd =3D container_of(genpd, struct scpsys_do=
main, genpd);
>         struct scpsys *scpsys =3D pd->scpsys;
>         bool tmp;
>         int ret;
> @@ -737,6 +742,13 @@ static int scpsys_power_off(struct generic_pm_domain=
 *genpd)
>         return 0;
>  }
>
> +static int scpsys_power_off(struct generic_pm_domain *genpd)
> +{
> +       struct scpsys_domain *pd =3D container_of(genpd, struct scpsys_do=
main, genpd);
> +
> +       return scpsys_power_off_internal(pd);
> +}
> +
>  static struct
>  generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct d=
evice_node *node)
>  {
> @@ -884,7 +896,14 @@ generic_pm_domain *scpsys_add_one_domain(struct scps=
ys *scpsys, struct device_no
>          * late_init time.
>          */
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
> -               if (scpsys_domain_is_on(pd))
> +               bool domain_is_on;
> +
> +               if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_V=
OTER)
> +                       domain_is_on =3D scpsys_hwv_domain_is_enable_done=
(pd);
> +               else
> +                       domain_is_on =3D scpsys_domain_is_on(pd);
> +
> +               if (domain_is_on)
>                         dev_warn(scpsys->dev,
>                                  "%pOF: A default off power domain has be=
en ON\n", node);
>         } else {
> @@ -973,6 +992,7 @@ static int scpsys_add_subdomain(struct scpsys *scpsys=
, struct device_node *paren
>
>  static void scpsys_remove_one_domain(struct scpsys_domain *pd)
>  {
> +       struct scpsys *scpsys =3D pd->scpsys;
>         int ret;
>
>         /*
> @@ -984,8 +1004,14 @@ static void scpsys_remove_one_domain(struct scpsys_=
domain *pd)
>                 dev_err(pd->scpsys->dev,
>                         "failed to remove domain '%s' : %d - state may be=
 inconsistent\n",
>                         pd->genpd.name, ret);
> -       if (scpsys_domain_is_on(pd))
> -               scpsys_power_off(&pd->genpd);
> +
> +       if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_VOTER) {
> +               if (scpsys_hwv_domain_is_enable_done(pd))
> +                       scpsys_hwv_power_off_internal(pd);
> +       } else {
> +               if (scpsys_domain_is_on(pd))
> +                       scpsys_power_off_internal(pd);
> +       }
>
>         clk_bulk_put(pd->num_clks, pd->clks);
>         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
> --
> 2.54.0
>
