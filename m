Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AA43B71C7
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035482; cv=pass; b=YbTwqHc/dGnVacgQ4aQ4BRSYlK3/IGT3ogdhG9Uj3hyHLK3Jg6Kklfm/3MevdxK8zTSyyRwXkbFtHckGiGoS4xTwNU1yEmzwDyhZzImR7J4MJYorPUdGkgGOieuXDoKtgIDJmWxgr//QzIETuGZN+H9LlcDfTxhOuLvyMEsF5Pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035482; c=relaxed/simple;
	bh=xJtlT+brubTDzcwB1LsQU2wH8jfhem1ycRIpQIZsMuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lf9fc/FBel3M1lNKrgAqGvVaIe1Cjy77J68oDtuVQrdKWWEtSTNd7gEbjiW6kbr1DyC1ZzU+Z8jtkhzj1wVXnlXD8g3wOCmAsnupvqzP2wNoYK3rO9+8M1Jb04Yd9fd/uW2WYdb735OhNl6U2+dUOfSNOBDrB2kP+nswzhdOKCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGKqZv6u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYG7PFlR; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGKqZv6u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYG7PFlR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8prVh475031
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 10:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5o0LQq2H5NyuqhWcIAsOhclTasLhXE6zFp16BztH0tM=; b=PGKqZv6uqTxJsb4V
	yz/56PwDXoYI/+DTCIsMR3DS/Z1r3noojO+XzGn4dFF++mrEALLWcGYqgjyWe3WJ
	ZHYBaIZghgOs2KV0ThF9P+XHnCRbNDHS5d/9EFsz6fhbSRUpiEfy/fBUN9IdRTOA
	TW0teNVSH7BgXWyi7J4XQvW/RwS0u1vLSONrNTUqUcRTkuyenE4y8wVAhp7D12bc
	YYaBUeeCvKRDcdXwi9yU0Sf8UBVOV/8PTrIKBN9qSXquo7+Dyvmf6QsOlNPpf2Yq
	nah7yoUwbbBLZawcshuQMNKa5GbnhltI41cGg8CkvKkDjBxyHIp1j6SDVwjDSzKP
	JBStIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygub9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 10:17:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so10839594a91.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 03:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789035478; cv=none;
        d=google.com; s=arc-20260327;
        b=ROwzGvpDbocDHQAarlQck668HMU3caN+iaZZQgCBGiSUxNKggjCWQ6I5AekI1NDKNk
         QCqkzpSEtPO2J89ZKgyfi44HoOdsH6za3Z6EQ7+DpJtV+z7o6UNXOosQ60xbqMyIL6J1
         vJWJB5yst8O+E3EvxMH9mShQP0/4MWlQa7VgomZ+LBN1C8G9O0wefKWnIdO/TM77ifCU
         lI9dHnAo7aVW+oYD7lflsu8H/dGS3hGoAZxLMnsKvwgFDn1ixWb2l+KjP4STNOkAn0oc
         vdGaP1K5gPtJfjTxb01Chkbo+IIQxjd8lSqqroypSh6iShV9brcy9pyjXmnJmC56ZYJV
         DZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5o0LQq2H5NyuqhWcIAsOhclTasLhXE6zFp16BztH0tM=;
        fh=x0XJG1aPIGS2P8plZxxyI/X9urAf2LPIv9AEUV5/oKA=;
        b=Qbum6qBVBZMX7g+9gm7GsqtPawgYbvMxuwIac5CamhFz43rsM+L1zEfeg/ZRYowsuy
         Yhs/EirvipZhMPTJooWJWYOsgJarxfcJHFNE3irZfvnzqZ7BwVZxgQCBzIMT47PKRrDn
         Vqb9YSP2FyRpeHT2blee1+bqv4DO5OJXz0Zjqi3xV6cpsRn0MjP3SE/mBXgOp1B0rK1y
         JyuTDJxc5rnq4HQvujZ5geOD8QO2rtCFbI72VVwlOuz1ec/xNtkXJdLHXBtBHRE9Jh3Y
         iwb7OO/z1hYriauO/fi1c9pS3E3Ccm3NvtOLgWs1nILApEhL7MCubVK7jlen1EOVZGmJ
         yyGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789035478; x=1789640278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5o0LQq2H5NyuqhWcIAsOhclTasLhXE6zFp16BztH0tM=;
        b=YYG7PFlRv/m7RtW/2T+N2DJNrZXsXtWKhFJOa1UdQ68pEJDuw2oDtyLTbu+wQWJqvJ
         ++i1ue1XoDSxWUvDyBIiYzS/frVNffrU9P9onZSrRwyVo6A3rY3Urmmj5kvDmf/X8W6i
         ektBJtxE8Zl+w6+R9Xsixdh5tvaKkvwfpmLOiEQHgVvxBsQnb/4j+iaQtMAQeP21m+HQ
         dZOmFs+ZhrWX0Rep3xscs+Worxc536G8Qt4fkbY/VeIxwx/6MmOr1WFKjnVDiHZnaj+P
         ibWw/LjhdjXtk1z5Uq5qcaG+NMejXFHerT5KsK26vYHQ8H1gRZZ7f7tnR4YQw6y4QfJ9
         N9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789035478; x=1789640278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5o0LQq2H5NyuqhWcIAsOhclTasLhXE6zFp16BztH0tM=;
        b=h4OPh5I5Gtb5fqlYizTYfESmOK2Zh/lPZUeJC6ZQ61jbPqCws2kPm2SWB6qj5OH/lK
         xTt96LaBh0Wu1IdkRlurtZHONVEAL5MlVk6khgvMap7sDx2+irClc7GC/FYRb77imkIK
         b3MPZVWLTzCKQMa8yIQaBlvVzTugvDOH0L13vfbHrQDWzA578QvLDVQnufBrYV54fCCJ
         Xl8CVTTjIoN/6dP/RZLaaGb5Aa2uu57Nd/A19sseHkoUAUrTZiz+ZikM5MY/hqsh/4Yw
         Xvwx2IEydrzEKMjenh5VTQmzl3FZvVcLiXyjG2+ZsVVbCofW0L/pz+azNhYHREL876ZO
         CQOw==
X-Forwarded-Encrypted: i=1; AKwUvBwOrXFP2f2XJs1z/1+XTipdhq0oCGuqvKVyevbbzeQZeTOoF/b6IlUrJZd5JS3vf7xEOKrR/qFyC6Cr@vger.kernel.org
X-Gm-Message-State: AFuF++lBo40QBI2LNth//vYxiExeA7g5AtAr132jqzOgw9vItzOYXKHp
	qzMGIHK9MjMTDzJhM2TvHhzVxRu/g9z7HQkeFu3DqZjXjpfFyr8MQSJCKJqt+5lU8Ah1EMWSMJf
	nqBKn1icYxwwq+HXERg9vogUCWeHtI7CfFzhrMQZFQdUnhE758m6Qt1+jDHFams5S4qRn3JNbwb
	b/En66Lu1XxwBiHjtrNu73yZkmOiFuXU1BYdJj4dQ=
X-Gm-Gg: AYBFou0RaOV1wP7KvHiM0OTQlNRSwMuJXVbLOFhOSkyOq0fFTV04+32+MxTy/MK0Nto
	tPsaI/tLHitIJ7guen8iX0nt0CFSJ4aTw0yKHM5UUoDoaWtkTFjmekdcvmh5A+1CUl9A9dkVtMP
	YnERJvjOYksQnTFX6tMam/OC3UsqnMHm6D3+A6eHM33eKoFAR4yDYipVgRPQ==
X-Received: by 2002:a17:90b:558c:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39d70ae1a5emr10579647a91.13.1789035478537;
        Thu, 10 Sep 2026 03:17:58 -0700 (PDT)
X-Received: by 2002:a17:90b:558c:b0:38e:57a3:f218 with SMTP id
 98e67ed59e1d1-39d70ae1a5emr10579584a91.13.1789035478102; Thu, 10 Sep 2026
 03:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-3-09271f583dc6@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-3-09271f583dc6@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 12:17:46 +0200
X-Gm-Features: AcwNN1VvsxYSlSneh1UTJxLDFcgkCYVDC7Rwi96BfcNazOVn_vX8zy2Sk9dMolo
Message-ID: <CAPx+jO_Ltc6Q+VdUgOs81azTiM5Vx12GH1z+CXt6NW=M601THQ@mail.gmail.com>
Subject: Re: [PATCH v12 3/6] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE init
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExOSBTYWx0ZWRfX3q5mJ+IjEone
 dAoxfP/7slwjHB1ExK7YgcHIY1QGrfOTejknmPWc17Tmb4TXAcqj3ix0hklKwgGhp6YPRWelVNv
 WZwpi/0S8MovgN+e2oJkvOeKc0q4q/t1b1GF0XmYH9HPyR6meU4DpoW3rsIHdhU+pBe2Kr3plg7
 /LCfAyYoy7ZRmLNnHd+50EZqQFbK5LSusqZ/3AxNOyGdlhomGT4yBfXawXOoE7SnfLo0uZoKAa4
 uG0IKgcJHBPzLK5B2P1PoMmqSY8HSjHeFmSi7Aa4tgv2ZoYkkgQi6RKP1u/qdgibNZ8NfVJDlGj
 YRc9DS5cEJIXmfm3v3y7l7B5Q7HoxRRkT5KgGsx3az69f0Y3Aic5/Cp3ZrbpPQ7+Lx/rX+UiAYF
 sK/TQFmiJrG7HIlBORulBEB7mP17jfQKK2UYA8tirdieP8nsppEPItK08aitbEKf9BRpdFqt3gw
 xaF0edUojkquh8/U0dQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExOSBTYWx0ZWRfX+TLExbbRJ5wb
 wSRZUWohUhUK6r8WYQ1s8PmVIuD33jKB5gcQ8nFm0Pi+jGOd2OMDo2FPRkGZuaie+1AFy31ZWgz
 hshkmwBITT6py2mj7dPGIc55qLnHXfM=
X-Proofpoint-ORIG-GUID: E2hJLrrxVl4i-QWwMsGwVrVXuMm4lC5O
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa283d7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=i-sMpDq2_rzAXM5hadQA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: E2hJLrrxVl4i-QWwMsGwVrVXuMm4lC5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100119

On Sun, Aug 23, 2026 at 9:48=E2=80=AFPM Abhinaba Rakshit
<abhinaba.rakshit@oss.qualcomm.com> wrote:
>
> MMC controller lacks a clock scaling mechanism, unlike the UFS
> controller. By default, the MMC controller is set to TURBO mode
> during probe, but the ICE clock remains at XO frequency,
> leading to read/write performance degradation on eMMC.
>
> To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
> to align it with the controller clock. This ensures consistent
> performance and avoids mismatches between the controller
> and ICE clock frequencies.
>
> For platforms where ICE is represented as a separate device,
> use the OPP framework to vote for TURBO mode, maintaining
> proper voltage and power domain constraints.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

This looks good to me!

Although I have a question - should we never drop the vote? Like at
suspend and runtime suspend, at least?

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-msm.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 0882ce74e0c9bdddd98341a67b97bcef74078e0c..1b4c276dce34d76dcbe75117d=
e37e09ea2002633 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1902,6 +1902,16 @@ static void sdhci_msm_set_clock(struct sdhci_host =
*host, unsigned int clock)
>
>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward d=
ecl */
>
> +static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host,
> +                                  unsigned long target_freq,
> +                                  bool round_ceil)
> +{
> +       if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
> +               return qcom_ice_scale_clk(msm_host->ice, target_freq, rou=
nd_ceil);
> +
> +       return 0;
> +}
> +
>  static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>                               struct cqhci_host *cq_host)
>  {
> @@ -1959,6 +1969,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_hos=
t *msm_host,
>         }
>
>         mmc->caps2 |=3D MMC_CAP2_CRYPTO;
> +
> +       err =3D sdhci_msm_ice_scale_clk(msm_host, ULONG_MAX, false);
> +       if (err && err !=3D -EOPNOTSUPP)
> +               dev_warn(dev, "Unable to boost ICE clock to TURBO\n");
> +
>         return 0;
>  }
>
> @@ -2149,6 +2164,13 @@ sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_h=
ost)
>  {
>         return 0;
>  }
> +
> +static inline int
> +sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long t=
arget_freq,
> +                       bool round_ceil)
> +{
> +       return 0;
> +}
>  #endif /* !CONFIG_MMC_CRYPTO */
>
>  /***********************************************************************=
******\
>
> --
> 2.34.1
>
