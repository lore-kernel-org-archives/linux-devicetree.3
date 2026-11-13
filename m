Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794575676;
	b=oQ/Rif3fiMtdQatzm/9+UZraIq2Qgl3rHxu1F7iHsyEEADYSwm9TPVq14tHwIysozbOx
	 jMCs8/07sW89XBXGIQn0d5TSh3PDBhmPz95gOyoWfOktzJ/ETKOs7TkEUUyO2w8xfHGfx
	 E145mq/kmuHOqlBCSAodxT26WD/nfNlMdSP+Oa5gha3zA6lslw3OaDu7bfKA29pPR2uGS
	 zobRMB7c58qEWfvbXenfCAVZ1/slP5vIBXb/zLruoukLsQjshXTl2lg/awqDavoze1Z8m
	 oE4QM4jwAMFC4Jjls/3qXsGaJn4tpg5vk+zJ4vPedcuSVKJZXOpVt714rfdXuU1F6mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=;
	b=Uy801F6xYcxEqKRL+fFVRoxJ2mqTzZlj/zxP0fU1abPxQlwFqexzwBo4eQBoedIyLKlP
	 L+R1eG3vXRfcQzKo5PTESc8E7MpItYJYv6GvjsyEpZVKezoAzrOVyjrCdXQ1eZMQOKQIU
	 zOD2mkRh4tMnz/Xhdju0DmV9ZQK20eoiq+EQKRjGM9+DDCHnOVt2BKxCI8K/BqjhFJIw5
	 88HMsjzGIbzvV4LKMbuK3Mif0gLsTN+vnuFOizDJZ2kq40nQqWyjg/3gZHErkcH+G4WDu
	 1xHjOr3JvEz0xS02ZpoFKEjx0Hlqh0hUVKDmnvnIl+FvBvSG6MQ6665y/+BqE2U5h9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hXUGRL4y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUfdZhpZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA23606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA23606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hXUGRL4y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUfdZhpZ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCKglP583991
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=; b=hXUGRL4yHi00dJim
	M25dk6Dz2Sx28JEYAIfIC89lLjEMl09eKnBGb3dStt55GUkm6DY/ppMLhXV61X7g
	IbPQoDpwCNdD0Xwq+UPXPFLgt+NQXSg4zeLjPPyhon93RLbLSwGsTDQ5oDUwwwBf
	acYRDQ1x3Ss6ukHMzrWf3csw9HeFECM3u4e8BxcdynnTmCVnpmqbUg5PLK8l1fud
	fkNdr10V/zYZnLIEPQysW+ApCS9J+Ua4/NjMJe73UuGJa4rK4pEXt8ZFX0jShDYk
	J0YrM9zaEEuORdgU9FKOQ8NbfzZHkM4nZx4NQuqs6j2DkhuD++kXM3BwyAzCYX0f
	d+Klxw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0akv3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:14:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1782842a91.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794575674; cv=none;
        d=google.com; s=arc-20260327;
        b=rkzwA2ABykZpyW3v9nIgxkssSf0zuiyipIO+nJ5EqTU1S4vNolKkAW3HsdBJR2OeIy
         FQc5QRhX0Zpc93UJedCr/yWdXmNY7g3Ox77GtCNzgVZ+N5eysbE5vrHqAppjNbHZHI+X
         f6jkzo3HhgOh0CFOLqBYV+U0nbgD92NrbfE7YipAG/5k8/+D1AkWIhi+1jC4J+P7Sj1g
         1/LXEb9mErhiLIvqRj8bjHt3E2RUME0LJQbZjmokucQv0mj9t+QyXYXgFYUv/HDjyHCO
         WE0kOemGAuiJgy8+XfpT6Lg6gWFaFDtNQy+YnQ4S1ceszH3BFcOI9oksAnehdDWmfTZL
         teIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=;
        fh=D963GHS+9Vx5ras0vuu8R3Ocy/DhYa8Dsmsn8PxPLto=;
        b=mtrE6LIwdgifnPfRmOBJDr5iPUp38bcAnhWaLOk7EYrbaiiSuajCWh84RWcTELPzVD
         nbRmKmOi1wW8fznDCBpPQdcDw5qNIVgCuAa/JN63rvleSPE+ECOZtR6cQ9Qwns9il/ef
         BX5JjI/BIVitSo50OUW3BdXVM8H1gnqrxjw7wKWy+VDOScDKCn0IsXbg2RYxAlKzPAej
         PiNl5vx5si4+KKLuBTjsXHOm3BPhTDz5lfdN55kGku+WIfcuj3xaKrIGcJ4GjWoFqgtH
         QFPp0/ddw2/R4y9tFmEIqE9QjYa2SQJMNn8nq5MCPrRP5APsDzlN0RhXhheZU/HSNTYO
         Fcqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794575674; x=1795180474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=;
        b=OUfdZhpZwliFBfR5ez5O5FvpneaurAsXoS0SkZMWHteOMDJ50kdEpX//EJ/hVgPdgY
         9bIbIC6UMCzPjrA7nKDC0kQ2//OKDomwYfVGOdtdaHzP/Pum3u5F8lbx2o8ZfHMN9v4a
         /LG0fizSbxJRCZHLv8a0ZtnCpryVT3gQqge1Ozu0qWhplcg26OvjKjzSSgpkNraOXBgc
         WWXNCJB1QL3M5g/Wra+5XS6Gjf37XIaLxSTpETll+yVay5PoQ+HlZQqFSnR+EDAGIOQE
         VVMI82mgZSkda/XYYcgBanvOJsPL3ZgGFVtvi+ia5rc/i1kXjLLa79c2RinQKE6Y7n5f
         cenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575674; x=1795180474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=;
        b=S+R3pITJRDSgd/aiG2MD9+D9YrNBMBO3Kiqgsx0XgCVX2KGeBdTKWVbYu1Y2HlfQVO
         AgSSaZbBl6Mt91+cDn494nR5VZdoCLGB/DmA0TPCFMrA5zhCYTVAgVdR3nQMKZZ6LV07
         rVdBJaXL1uNe7St5zn3U2U/Z+UQ/WT+3G0eSHxPx0crAZyeQ1wzmGcIQMHijFf4EktZy
         mIa8htjSf0HQK+NkXU1BDl2cA44zCJ0PLbJg/Lzwt4vPoq9K7N93MqeqeF/iyXtIVn1a
         bg1UxdG8s+FE5/Vdb1upVx4OnD8eCwmbqXRehtWx5xbeEXsyPLTR7KEa+xj+xSjHBkQW
         vhbg==
X-Forwarded-Encrypted: i=1; AL+hErEZR+nH6W8D4AOzy9K04cIVzuHEiJL2CW/WOlFmzHOfZvGBf2gEidUCGsBDF8cTEPkf9NbF6tHcQJIY@vger.kernel.org
X-Gm-Message-State: APuU4Z+d/ARPLRbfirEknauXJSUEt7VvNKRUjtnGgYnbCrZJOpdamFqo
	M+5cVzYp2DRKmeSr8m9JUSqS4WjaMT+nkdffOFmqGERYovokU5TQ2aZcD/gRK8tjNzEBn9i+OE/
	NrANhm5qLMPjALylIxmIBvom2Uhxsi92Tv6Jxsfic89kKhA4gkgL6lX/Px1p2mh2ia31uWzBudF
	LD8AwjTNOc9qy6XUeh9N7P2+WgMra+DVD4RJMtRR4=
X-Gm-Gg: AYBFou1p7FmGcA9JtHxTXZ831NUDpxjM0k4W3flqovWRr8w2nQDg7MqIrwVYPikFG2R
	HO1iqm+vTCv3F+dDxcwKg3IuGAbsIMfzjIde8ZQ/g1HkzasldQYWJ0aTK6xO152KxYxv1nM5JlC
	Hnt9prD0NNHZ0OC2Dw2BSCeQRh++W7D10cbBTJuSVwzB2B/t/3/2Aq6sWLGw==
X-Received: by 2002:a17:90b:4c8e:b0:3b0:d808:a991 with SMTP id 98e67ed59e1d1-3b1b0d3420fmr2545472a91.55.1794575673644;
        Fri, 13 Nov 2026 05:14:33 -0800 (PST)
X-Received: by 2002:a17:90b:4c8e:b0:3b0:d808:a991 with SMTP id
 98e67ed59e1d1-3b1b0d3420fmr2545420a91.55.1794575673121; Fri, 13 Nov 2026
 05:14:33 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com> <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:14:21 +0100
X-Gm-Features: AclHuK_DTsDuBkxo1YAzBq_C8oLcltIpHJD3FMGKMO-2WiG84I3huHHxGsWxuKE
Message-ID: <CAPx+jO-qPAuOGnGfCyGnSYym8PBOaqUJptZh8duYJKZN4HARaw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] cpuidle: psci: Allow skipping the suspend mode switch
To: Reza Kurniawan <imkyufie@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfXzPPNfXWyPHMt
 CC5eO6LBxKgiCAUq74YgcLKKb5HjPq5fE45Ys9zUErF53kzgYQnPoU2FBNYcIZ/wenWWRw2TYKk
 r5SFGOaEN1YF2GZrgZdqbU6jpz+v65Y=
X-Proofpoint-GUID: iKe-bYRfk80_GDsBHRfdkXdgK5SJXVdj
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af70d3a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=UY4Qpe7uAAAA:8
 a=Bs3vFoulODVTn7UWAnkA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=Dz9CbhmWzz49oM4s8yQO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfXzbBA2Y9obSaM
 MaSAjnKPcmMMmvrSwHdOg3EgINgaLMI8DiAZwxX95QjmoyelOa009JE5iICNdz6kNjWqiNXhBA7
 7jxX+DRlNux6sE0BlaOeliVkwFjXdfSiMpiuTo/PiEgxKTPPbgRUhaio8AYk1V8/lIISFArDLEi
 /6fFKuM68GWJYVQuQ8aQa58ss1Y3GecdMFsxO2CosCcwkmdc2F9aJwwVXiW9V6Gbx2Z8KQPr2el
 gtJ+GE9ndJrPgEy2GC64SJHpelliaLD3R0buE4jpf++GIaFa7rIgTYU9JZk+weJEYF9Q+b5eKPk
 Ikxs/VUDMjNdKjEy/n2mONtlCN15qr/cx6If1LWj3G6t+yXhpq2+RjqkODcwa+/mpBcMXE6myhf
 Up+rQyXG/4ynwssy+DKrhKs+0eBwkDZAeQI2CRW6T3NUTCnBHpa+TC13K6pnGabdioAZuL2C7Yn
 P0m2C0yL3rQygmDgUZw==
X-Proofpoint-ORIG-GUID: iKe-bYRfk80_GDsBHRfdkXdgK5SJXVdj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130052

On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.com=
> wrote:
>
> From: Alejandro Tafalla <atafalla@dnyon.com>
>
> On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI reports that OSI
> mode is supported but rejects any PSCI_SET_SUSPEND_MODE call with
> NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and the
> probe is aborted:
>
>   psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
>   with error -95
>
> Add support for the "skip-suspend-mode-switch" property. When present,
> do not call psci_set_osi_mode() and continue with the topology that was
> already built.
>
> Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> [Reza Kurniawan: split out the patch, added log message for skip case, re=
named
>  the property, added property check at PSCI initialization]
> Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
>  drivers/firmware/psci/psci.c          |  6 ++++--
>  2 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index 5722365b94..cc9f14769b 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -159,13 +159,17 @@ static int psci_cpuidle_domain_probe(struct platfor=
m_device *pdev)
>         if (ret)
>                 goto remove_pd;
>
> -       /* let's try to enable OSI. */
> -       ret =3D psci_set_osi_mode(use_osi);
> -       if (ret)
> -               goto remove_pd;
> +       if (of_property_read_bool(np, "skip-suspend-mode-switch")) {

Rather than reading this property here and in the psci fw driver, I
suggest we just do this in the fw driver.

In other words, let's make psci_set_osi_mode() to succeed when
"skip-suspend-mode-switch" is set.

> +               pr_info("Initialized CPU PM domain topology, keeping firm=
ware-set mode\n");
> +       } else {
> +               ret =3D psci_set_osi_mode(use_osi);
> +               if (ret)
> +                       goto remove_pd;
> +
> +               pr_info("Initialized CPU PM domain topology using %s mode=
\n",
> +                       use_osi ? "OSI" : "PC");
> +       }
>
> -       pr_info("Initialized CPU PM domain topology using %s mode\n",
> -               use_osi ? "OSI" : "PC");
>         return 0;
>
>  remove_pd:
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index e73bae6cb2..3226af6d89 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -791,8 +791,10 @@ static int __init psci_1_0_init(const struct device_=
node *np)
>         if (psci_has_osi_support()) {
>                 pr_info("OSI mode supported.\n");
>
> -               /* Default to PC mode. */
> -               psci_set_osi_mode(false);
> +               if (!of_property_read_bool(np, "skip-suspend-mode-switch"=
)) {
> +                       /* Default to PC mode. */
> +                       psci_set_osi_mode(false);
> +               }
>         }
>
>         return 0;
>
> --
> 2.56.0
>

Kind regards
Uffe
