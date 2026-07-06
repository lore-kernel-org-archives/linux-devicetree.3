Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CAF4314AC
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352859; cv=pass; b=pjzWOHC6NGtRXyoWaEym9UTJqLLb6sSUD5Q2CjaKa0eu0TrNa4SvA9MwDf0vvQbaAGWWP2yerT9TdjzS1qCTEjMB6w9iKuBhuqrYPCUUmwmDebF6QnfAq0py/2nUW7VIRcXNTSdIVGiLxAwIJ0K0kwcm+WqGrkUdowhXHmYv+xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352859; c=relaxed/simple;
	bh=CM+ubNu5Tpn4oFeIeJPj+Kz+IN8dhQecln5qBTFzr1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U4ny2u67ewIjwtLOm71O3cY7msXbKQz2TwiuDkvkEd9CdPBJPaeJ0bKtNvrIusN9fMb1H/PZouigMwl0WB0vDRetg08qOy/1MUh6P51LjDvGIdoJjkAoPn7z3uaK3HwVEH4OUDl/kwHbeLjTGf7JBbLoLMOEFSuIz29xQCvqvF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JCGdUd74; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWxKnN1O; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JCGdUd74";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWxKnN1O"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF18U956528
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WxWaaRb93QDxqs8eJfGcKt+ODegJrM9FAhD1rn4dPwQ=; b=JCGdUd7433iyy6of
	C2ieIfbLAFPJj/a1Av//CnFq26oYmJ3u3dTULDOCRCcW1uV4qG2Pu6x7bm5t2d5B
	O+dpelG6Mc+qLkskLQYLSa5a1OuiO1tjDBe3Ebie+2Q93tvXWR1j7F44RIW0R3Vz
	pSuvZhWR8PcjBFabUYYBDkjrygbYzieHO3uMgZvyn8iXJ+YU/me+lPZ24MX+rt3P
	dO/ywJPL2oDJNpYEKlxNlDZG2rQk+6ntgcFNYgdk3AF/xRahfGXP5/BzrWq8MtEw
	LRun+0/hWL6co5Ya51FTY7qLbihQx3hJAGIUflBMNgBYmAQFhqAdGgsEWah8Pmnq
	3EHF0A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891usvud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:47:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ec3314f65fso34317596d6.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352855; cv=none;
        d=google.com; s=arc-20260327;
        b=orPgFMHRnApsfJxfKe5sXIz7KWDiLGc1NwNgRfdQ4bmoiRXAX31WjWR02ACGFL4ZE4
         Sil6UqSUDVuOzmhZyTyjaVTNP1Cik3ad6mPN9BC1ykvWX3OdIczONe2p3DdVaoHkY8cj
         RtW8aeGbH9+mOaKyDTeuv459c49z/Sq4vmR9KV7Id4EfJaaEl3UwqLl6y6OJg3l5y6iO
         7oqodck7zMCyvH3qqRURelGhTrmsoYwW2CR/F1sv6mlwmtPs2NsQhTjcG0Bc9unrNyqj
         VcC/UJFHKy/p0WBkjxpGM+yo6B0s1Vu5k9oA0sc5VTT2X1mlUksOhLmjnBwB2qleGQ2H
         /TmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WxWaaRb93QDxqs8eJfGcKt+ODegJrM9FAhD1rn4dPwQ=;
        fh=7cUGetAIEIpJ4P6qlgBZ3gRPfmZwaDaz6phoeStr/h4=;
        b=WNuAj989/UiN5kaJS9sMjChXibfn/g3UzxzWxS4v8wjsCOdkZpT18RlpTaYn0QNQs3
         pxY9GmcRsbn3XvwORd6PaP/p+pAzHH5GdTlBxFFPANjx6MjMPboKpCUlUaukVsszbbM6
         0Et/D09H56Nx7zKeKrUwKFrKkkS35Bh1nGCnnj09m56SDidOgZHwbyLiOj2wXuSGbOq8
         4uRMwJlXg8LagDVCaWQsd+iUaSThlXIpfMp95WIpfh2ma1pAMY9GbOi+UtXbgtLNfbg5
         BJd/rpizP55jBiew3O8NjLWP72OjKGApNpAdMqlu7V2TQjfsAJAMznxrpmlKvZ586sTk
         7x5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352855; x=1783957655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxWaaRb93QDxqs8eJfGcKt+ODegJrM9FAhD1rn4dPwQ=;
        b=dWxKnN1OJQmCpigmpPaTUYpe5TkWNbAd/vKRSBYKcC4bZ/gyEVgePSeNJS2aIzGJ2+
         zkXr9MOaGYwq4maIdVxSZTEWYyVZmpdkMwf4ay9JPULRb8AcsX1TdDT8TpEKBIrWRxUs
         WomlQWTWx7lIPw1jApfRrvyKrr/ng2grpnXIafZrpWnHURRCRzOHQdT6SN0jFp9GPczE
         8Aesb3yhGOUg/saOBOzSViefClECXrGzMWRnupHOgdIg/xs4NRajen1S/reKZmT6PWKY
         D0WKOoLdhCNAjynrROrr1ZszeEmRcxfS2Bq4JlsbEP5U9RAQc0EZnAo46+03Q1o6i+Er
         K3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352855; x=1783957655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WxWaaRb93QDxqs8eJfGcKt+ODegJrM9FAhD1rn4dPwQ=;
        b=U3KMKXNzZLYyw8YOW3AH99fDh5kT3CjaggWw9fdnm4KdArw2DY98kom6Io2yPMdtUt
         Qn+Gi0BLPGuCF4zsbyecdBxffq0X9XlkgyWlBLEA/hC/vASg+szGKREwCP0jNIOD9Q/N
         UPlv6P83/cp+N0BA1yMK1skdPx8jwacmG0VeejnYAkc6p8ATdV7YhYfBESemKwug/UCS
         HdsGysLU8LWeB1soHoUA1rouXYK7sShO04GHQKoNoeVN5dXVavxxxrphzUK2uAasy1d6
         6yIiB07AeeeRu74MUubcCAsxGDenBNrzeb6Fm6uQWvKr0hLqKSOrMG4Tzsry4JKDVw7m
         h/3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq3KdJVfe+RKTSVY7vs4TU6g9QctydaQORsnjGzKVhWAF4oMgofaQdbVO/iYyl+VcF7mowH4frCdkyH@vger.kernel.org
X-Gm-Message-State: AOJu0Yym5wzzTOShA/hnB+1lwpjdxJJpQ3LvQGcTckXaAhFhMXWL6pzv
	6lVtAmxNNZ8/zYOiirASNKDLYEnBSyEcYgA6o0QuIHeZaZpUkqpTC7d1L1jLfIACkP1npVjmQEu
	UA1ooqTFJD5g/zacabpyFrN+uTm0bCGi/JDAwtAL7HOZTrm7iOFBCaCQPfGfqnHkuNW26NhvQSa
	QmygxEQttdCmzEQDf4TOR4ryEMHik/GRZxkPmVerc=
X-Gm-Gg: AfdE7cku5Ku1S6Kll7b0g+S4epezOrQ4LbF7camdV4fvtt5vn/PuroSRcYQiNMWjZO/
	xLsfItvogcW8FbMDSrcBMksp6PMTEEW3B0qOPu+d3xNBtQ5EV8Wz2Uh8n8UhFBTjUltNs2WvEFP
	SKAfMdKlpaqOrIVPTRcBv2oDjZv/DnSlrCgtNrWixf94aQZ27NV2zPbP3x4hqnRc1AbwHx
X-Received: by 2002:a05:6214:48f:b0:8f1:579e:a418 with SMTP id 6a1803df08f44-8fcb56c8f99mr13325366d6.43.1783352854510;
        Mon, 06 Jul 2026 08:47:34 -0700 (PDT)
X-Received: by 2002:a05:6214:48f:b0:8f1:579e:a418 with SMTP id
 6a1803df08f44-8fcb56c8f99mr13324626d6.43.1783352853910; Mon, 06 Jul 2026
 08:47:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-st-mmc-v5-0-3cf0e639bff8@gmail.com>
In-Reply-To: <20260629-st-mmc-v5-0-3cf0e639bff8@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:47:19 +0200
X-Gm-Features: AVVi8CdvK6SaPleWpu9C87ndPSmgsnOwMTRoR_g7UJCEqp43DcokT7xQKZ8HiEI
Message-ID: <CAPx+jO9kjT0eMozVMiS8iot+4PEsET+Spm==p6vc7O_Eo8CGaA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] dt-bindings: mmc: st,sdhci: convert
 STMicroelectronics SDHCI-ST MMC/SD Controller controller binding to YAML
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: -8ggPKgvCMdsXERV3gpcvnwTMuQ-6RkG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfXwLbViYnunw+b
 unjo1HfC7kFoccCRk7fZ321Dw2e0knkpMsuFM1hAx84ReaLL0McixNUJdAOqEWbFHwQkWAxNYA0
 fKamvVOm5wOUgQf2ygABeDDYWP3/+vY=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bce17 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=X2qA2KYq_BSYQ49XwqcA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfXzpVaOXhMlGgW
 EuiC/bxK3rGbxmY3ayyw77zDTlSgTTBOFsX4YSw14jLF0Yh8v2sknhf7qvkiUmc74yzFGUdssAo
 Ab44GE8nhp3HCdH5JXwg4jUgtPfRZjT1ej/e9MKr9obgjWisNFb+6PA/Pnvov8cRZVhWf6W8HnM
 RiQwKF9OACdnrXxoCJwbLGy0VKfV5AqeGGP1IismLBaLmn4L1ldwv92Xnb6g7eo9Ts2XYlphS5W
 PlBnnViinYaa51aWqmTuiUXzMfrq0XuGdJB9RJGYwVd/7taz7reEm81uVNwSvDa59IKOUQFQXXz
 q7E8uIKCxNRbbPZg66ML1NuI/dZRlyiEkCuEk0TXFVgsBwAX479ZP9zfbBfe/VyVvd0GDWfLDpM
 MmC4abmk5rU+08x9f/xceOPUSNQWhN9NThkTFtrVXOQ55lsNNhs/4Qexag0MWKbvw0yqxhTT5bC
 h1xAHKkoP/cy5kPbD9Q==
X-Proofpoint-ORIG-GUID: -8ggPKgvCMdsXERV3gpcvnwTMuQ-6RkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060160

On Mon, Jun 29, 2026 at 6:26=E2=80=AFPM Charan Pedumuru
<charan.pedumuru@gmail.com> wrote:
>
> This patch series converts the legacy text-based Device Tree binding for
> STMicroelectronics SDHCI-ST MMC/SD controller to DT schema (YAML) format.
>
> Note:
> The patch "dt-bindings: mmc: st,sdhci: convert to DT schema"
> depends on the patch "arm: dts: st: align node patterns with established
> convention". If the DT schema patch is applied before the DTS
> cleanup patch, `dtbs_check` will fail due to the presence of the removed
> properties in the existing DTS.
>
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
> Changes in v5:
> - Rename the sdhci@9060000 and sdhci@9080000 device tree nodes to mmc@906=
0000
>   and mmc@9080000, respectively.
> - Introduce the max-frequency property and add conditional logic to inclu=
de
>   reg-names when the reg property contains two entries.
> - Modify the commit message to explain the changes done for both YAML and=
 DTS files.
> - Link to v4: https://patch.msgid.link/20260613-st-mmc-v4-0-b3c385617c16@=
gmail.com

The v5 series applied for next, thanks!

[...]

Kind regards
Uffe
