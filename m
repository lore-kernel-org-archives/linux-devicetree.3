Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F293E7BA9
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938560; cv=pass; b=px45m5UeHlhqypORNL8aFJXDmigf0lrVVrZZri6DE23V+6mGXvG/3WLDYGnnSR8LaUunu7hfj7qpUl12v7hfyFPUAH6kZ/CfZhCInM5N1CfDDdv43QphnXWpwkEuxdmn3PWOynOCqSnNx9b+FPyZJYAMXaqZETY8MFcujEedjkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938560; c=relaxed/simple;
	bh=g9PH7rit3zO//u5Hq2QTKSHhPM7nodoH6Z5rCiQghkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tez0b+4ACK3dxtJwiTKsk6em8nFMaoNHz6TPJJhZNh7biEu+TG4CQ7xJl2Q6yBrmvLUeL/Y19zUqOQvbnieHUio71MbiNzXPhUQHnvI/hB5Z954x5CSZLTRLRd3+544P6XYVctwYO6KLk1aY2Md0rTgPqt7KYIz5Bn0OsuGBPXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QNFOxgh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7kxtqMe; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QNFOxgh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7kxtqMe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7YoWC794297
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=; b=QNFOxgh31F+aQwWH
	ovN+MuWYrQupUnEJ4E05qCBe2S9rP7KHAIzWX8QuWwVLkBnQCTy1Hz9uUXC1S7DF
	8ziWPWrYXfAPxVQX7yIQ90tkfXiCc0VPr519QCrHicbq5mx/va6EOAY8OJvHnMC3
	RZF+ARzvL1gWrkTRgAmMOSEPMRMgnJsk3tSucarsmgrls/L4q+xlgyoSuIM/bgkt
	B+B96eVD2U0ghoOzlEzmHlymMGN9Zy4snq+v8VItrjMOWQ4hjzJIFO+xwOz3UgBn
	1yZtKxrH/rfPDe0dXOHL2JQMVO51Kqi381IJox02JTjVELMpumm0HRsXH/c9hr2z
	cyqT8w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn0m9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:29:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f0f45415cfso49161736d6.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783938556; cv=none;
        d=google.com; s=arc-20260327;
        b=PLaF2TXQOd4RoBsgXMpFMM37N7pi6nJ2qqG2S3G2DzPt2hVzhyQ8DRg9XxXbpvtkB7
         7NUjVaYcf9ZNwVzdKn3CjMmGaEXuWq/U7J0y0o27wBVE4FdPeRul1ZcZRx0e9OQGti5a
         tQPNiRq/I27EPNZneIya6QE9+gKlKDguPHzIjS7uW8a8wIDjQaeowiKFgC4ZkL8FLsAm
         zqQsa4HnODx+dRuL1B6gmLZ1IluS2DehD843VK5u4SGEB3cFhH1VBVD6CC5ISiQkBhb6
         gxcEGXclIraVsQzM2f/dZZ/n3unm/4KEvksCDht1C9GLrCaiss8/RN1CuPgR+UlWxR8a
         UyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=;
        fh=fyJnXuU7VWvaZzMCrSv6KhUxMQTshsPl1Aklq+I8o98=;
        b=l0bM7kTzQLS6B8eJYYIj9R8UbQxMbzPEgEiryd08sIok7yew7EyIK0vMnF+6F7ZH3p
         cP1sGrA5x19/kDGbDPq0ic9Loour08tH/IQg2nUJIMcNt9Dear00o/VI2EPGlT3BtUM8
         EETfipopyyt24HhQ367OfN45IKUdC/2oRDBAU6vyH2hDcse9qdSzVgpPIn7dVQ1WwB62
         Z9TtAwU0sZC2Vqhqm0SmiNYYacpPYVeE7c3O000zdSzF6Daa4Myhv+V21XhRiomTIC/3
         33BF7fMqpYy42/MpMYNEjvvo8n4A8QESLjPOdfabEZCcaerCHBmfd3ZONjueErBJNRMk
         QK/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938556; x=1784543356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=;
        b=G7kxtqMeECI0wOjoeOfWjKvWJYaxKH8+o/+b0CGIY24b4rLI8qDRn2gIv6OE/ADOj1
         XlwAlTi0gwkccLwXnu+CRigYuCwy+6AJ/6B+TkPFlVhA+taQEGm+YvbxTwchEJE45Gq8
         L8fsHp9VnxaakJLBLhDvesJzRb0vsSofarjdE9evF3g7IzpWRTrZP0awjtr12lS6nHAj
         hRuS+rJAHKSP1Js83ha10t5eyEERFD1/6mtETfNKxhVzYlRdaeaJ03pD64actt9fwo1X
         oLIr0yJkOj6jBWsAUK9FSujDVn8dDqWyNJ0H73aI5ytp/ZbiSBjeGDwJfAYKU+vrfh0O
         ZvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938556; x=1784543356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=;
        b=ga1jseBVAW8WVAhAhxty2NONw/qtQ3OOTgZBC4CCWdTg5OBJ0pp0jQwOxhymxZ7XYr
         TMioO23aBetc9Nmsofehq1or4blEW2IMFgBQqpRR1JW7NkV0XH3aoZ9YGOG/9BAJrQ6c
         O6ccD5RshTIgcgA/qzUNSYI2R9KDIdVkMGFzMMKV0TGkVM1EFuqHsZTiDVhaoBowJuvb
         9Fw43VF32SGXvMyONtr6LTY2zs6VW2Iv8z0R3HozGfXNeQTaejb7gJq9Jiv0BJLiQ2zX
         GF0vDce745gN7c1i60Fp1uvTB3p25zElLX7YGcPuzFGGBXaRdawxW01EFhAAabs6Gqh2
         0PNA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8Q9eH3vYkiLSZ0e5ld/J3xOgU3s/3sn+jyGXTyvk2iNGVEvV7T+lJlzvak1QpVm/jmS6E8oiF3gZg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe+pjLmU/SKqFqp0RLOtDgz9xQyZdLz6h9u+jmeLVKJjrfRE2p
	duknvGorCk6CWxHuLMAny/EF/yc9Bc5mctyMDTwqSlydpYVn5L+MuupDUdJ2fidH3gqUdGaKXrs
	p1UhTlIlFJaCkYKEPu10jj+iFEJjHtc094k0vsYXtLufwvOyoJCDJzYJQpNHVnxFSPnzhHnugBo
	0qzsaiGLWnu+Xs8U0AKDOVHR+qKPHIXQgjrzx5z4OepZo8BB0=
X-Gm-Gg: AfdE7ckZ6AC+Q4vWEvBCk19vzCbvbD914d9iFYbq9J2zH07HtYFaRcGMn0kaLfk4E0b
	4cCcioSLE0Jqo1kdk99UK9l3hj3g5SbxwJyQcKIT5HDoIFcU86l/Zn/YTYXylEqIAJmVzCZO5h1
	ZvffXk6yGN+rTNqx1S2HDp68VlZ8MigFEj6gFkPpWuzflz4QFUVTsisyFb0mz6PChX4uk2
X-Received: by 2002:a05:6214:238f:b0:8dc:2c21:32bd with SMTP id 6a1803df08f44-903ff76144dmr97564866d6.1.1783938555916;
        Mon, 13 Jul 2026 03:29:15 -0700 (PDT)
X-Received: by 2002:a05:6214:238f:b0:8dc:2c21:32bd with SMTP id
 6a1803df08f44-903ff76144dmr97564106d6.1.1783938555502; Mon, 13 Jul 2026
 03:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com> <20260706-pdev-fwnode-ref-v3-11-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-11-1ff028e33779@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:29:04 +0200
X-Gm-Features: AUfX_myf4-1EuuJEsM9iEruoBmhvEE1_shBmpnLHYi6rPSO8vgxEgiRb5eZm2os
Message-ID: <CAPx+jO-P3Yt6T5Kb97MjmMB1mYeEgjStCkSACM_wsrqsBVFEvA@mail.gmail.com>
Subject: Re: [PATCH v3 11/20] pmdomain: imx: use platform_device_set_of_node()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: WWOw-OP0wEffG1bSH6nuhtdeCwCC_S5F
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54bdfc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=-ghbRyKqcrg4NgclPfMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX9wTMYgZKlMxG
 JMBv0Oanb+7Pn/l7NbAc4ybY5LXOL9mvOaWpW7u/hgw1Ff4K99xk2tuWpHJzxJwJnWHdbBQ0yCm
 z/idXIsUNHRWYxEXjfPsOfm3IW5hc3E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX/0SUie9EK5PY
 ENSeqyL57yyhTPxczym19HUM0InRZ1Bcdu+KdXqD153FEMTsmb4blFSgIDjBXdlwK90gLbHUy4F
 GApZg9xqVEXAKu+yQTRUJTnWtkTRKZya+1MxPIyPXSEbWOmDMobSFWEit/5Lm9FdZARPBSAmuRs
 62kfVCHxctlZn7jcHM5utzgQ5NhMaR2FP504OKT9ivlgEFgaM5k5fDHguLZYzCOQ5b/Fzy2u8F5
 Wdno1+QoQU8lbnExzop5qDSLm2noa0i5Rpvwv9gSjHAjIKlUpq6gsgDhQWVHaOM9czOtq3SGQXi
 qYuVra8IR6iVpWHIV+LFyUFSqBMKpZPMpP8tob7OPHqEhPhYH6WoCu1+ng4qHKGm3bukUr39sYm
 +TTXARN040WN4J6OYcTrYhoLQxfsV7WpZTWb9DtawXlYr4hyqlOAv1id9zGRO+XdagU6vKDkhiO
 HMAV1xpJd4Wqw9DUKYg==
X-Proofpoint-GUID: WWOw-OP0wEffG1bSH6nuhtdeCwCC_S5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108

On Mon, Jul 6, 2026 at 2:45=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Ahead of reworking the reference counting logic for platform devices,
> encapsulate the assignment of the OF node for dynamically allocated
> platform devices with the provided helper.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

If not too late, feel free to add:

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/pmdomain/imx/gpc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index 42e50c9b4fb9ffb96a20a462d4eb5168942a893c..abca5f449a226fbae4213926e=
1395c413160c950 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,8 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       pd_pdev->dev.of_node =3D of_node_get(np);
> -                       pd_pdev->dev.fwnode =3D of_fwnode_handle(np);
> +                       platform_device_set_of_node(pd_pdev, np);
>
>                         ret =3D platform_device_add(pd_pdev);
>                         if (ret) {
>
> --
> 2.47.3
>
