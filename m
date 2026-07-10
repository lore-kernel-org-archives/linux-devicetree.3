Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4DF42CAE2
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688931; cv=pass; b=JmrUeeWvd2DJhbiikZUCAOmJtMMm4bII0ZkojApUm3p9St6dDJKeSAydHjIEvtiKrCP/KPeCnZqIgYlD3A5F4QRUiBqbD2uorobIUT/JtRNh+EjNnSuFWfqMix6QsAeAAOmd+jiUt3eRBL/tF9FWu2HLX/cXHXohROn5Y6kKAZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688931; c=relaxed/simple;
	bh=ps29wYiABii6l1raYJPu8jGO+QY9Y08lyWKo6XlwVyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHOPAukRjk600ewArPT+TkMwGC7nnlODqsgZn98Ti8QzebRlXsdt0CziXdhEx4q6iqR7BlNPg7vfgjmPdVQysESJyd8i76tX8FqEb5XGaDpWHdSat+9084V+l/udVc08+zF4So2UqHfTuGQQrsJnboRzshiL8qEwDUdAFgaCa/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQbhMoe3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/jXkmeA; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQbhMoe3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/jXkmeA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6Zwm700705
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=; b=PQbhMoe3PoBcb3Hs
	/DihV9aYD7N2odD9vazHqRjsDv89h5rZHGphaH+tpWhsa7+af5rBKTPuJdW8LPZn
	Mk39Wieqo6Mw60r42dLUd2Gxgi7p8bxjZpLshjrj7AzbL34A0DXvPUZmVUH4NX0g
	MgtJWs+BKx0AJ2Ezx5aSRboaeoiSWTe52rVeK8zpfzJ0RAwKpEqAfSYiOKp5qRRf
	EsdJxs0bExnyDS3qhxtop/v2dbSfVm0i9jaV/APL5yQgCnzY8s/Y1+SDeOsMMPGn
	F/+wgSzwHMID5UrcvHdiCAnKRs1pvv9gBeLt9XKdfGXLhg0wmyfSh8mZwn6Udt4N
	ZKZX0A==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8ke1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:08:48 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-667971437c2so1169522d50.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783688927; cv=none;
        d=google.com; s=arc-20260327;
        b=T1ejPJaVnDZ0bumhkCsBa2AaKkurS/EVF5FMQDY7yGB0LWJuSWzFzgJkATHvpa2sXx
         3e7SWNVzHdd08iEFu/rjyCvo8pP+FsSZk+VlbBdRu1UI+fyKZE+UuSefwWVAnToYPI8/
         DPwcOM/rAhW6kuLZxJndshB4x0r6i8r8N3aFGZn8dYERm8Jj3g2z5WJ7HaZbv81oQiL/
         yT5mDz6fJvQnKTQ5LAsMey5Y3xlx95psf2SOF1Lnei+T1pfu3UKrJWUK+biJL7dHYeG0
         dO70aB2T/NXTnrzDVH5704sa0/98mCZeXDXXiqnRmI/8xrLi3eb+lY0TYRu74IZtg8kk
         nkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=;
        fh=WxomDIXN4JjPJtEyYWVYOoOjQ8F++FLzcJAjly48N/I=;
        b=MuB/Fb1p0GcsniDz32bSyuomNLcUEZY3yj1UA5SsWGkhmhkLbLZCxPU9SWijID35nA
         Ak/uZI2XkggcdzpVlTxv6Cl7auUFH7vVubLUjJOjiOaSaIoQlxNoKCPcxJ2x2S7pEFem
         3qALh6mj8mPDNjB1jnNnqsFq4QSQ+bOTfEmdLg9UPiS+Jn5yCRIMb75VI12+LdbmtO8y
         6NKcw+YOJZ25EJpJYWikXWrmb6qnzs0NjIUJ9WCnAwBEBrTc2Dhx8YCTwntN6QTX/+Hl
         wlGS2NQr10IxJOxfexm4HLC4lu9N5blz8Xe63VZviGbVYgQvAGOcbd9hbeaBF80oRueW
         KjLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688927; x=1784293727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=;
        b=E/jXkmeAELPdpcsB5FAYtysw0V0m75uaNGlZczuE8t6cMDWaLn+c3GD6ANWg+CwEtW
         oBaBOuvxNivvTWWmvf1tECkRUK+La/a0NLK5nfPVbjQXDdcpN7hBe2jL7fb7q17Ux9JL
         4bu3ys+/mel3WOzcQxUtzSRJ3JMD4z6d5fPJ61mkY4d2RSZweS0mfRVMTg8Ig8+TMZYT
         pvANgz+GtJ0d/RM9TGRtUh7vgTSJesuRsd10yesKY77gSXqQPL/vVMvwWYyXzw1/VBwL
         V8EIP6aHxEpRQhAfVje+1FDH4ToWwmtmOm0qFvQ0AyazUGsdC3EKUoqSeQs27tcyJYut
         h1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688927; x=1784293727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=;
        b=VtnMIBfFnKdgw2WzlVwv2nXCBaM8abEGyrPtZinRMe3do5Dfj7VIZCFUIqV64oMehX
         yDMIU/9G1Ht+abXlep9QDlKvPfl/S0obvqRads5KH9NC+JWNQB5C5S1CGC4gXuN4ouwo
         +0uryfDfPNm1fujdvM1He6zA9R/9+hl4YPyrFDzDWuHC4OM2OiFog1roeDZ0Hbn5LGT7
         wuGEWdksQgUIUmg5bwaV6EMUjm+ECU2Fj7o8Y1UyQgJFo4z4TFJQKC7z47RzL0HLI+pB
         bpxGAOSEACAAV/df8//FG3nj9zrQ5b6csIuA+2LVrsubL1oOkL741hfnQ9AjOSL/Y1sB
         66pQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVXCYBdGiSNUxY84sTHJaJ5CUkKXYSUoZiam7W4TWsFUsTjJ/ZpD8pjvjfjWND0qWrITmHzA76VL5h@vger.kernel.org
X-Gm-Message-State: AOJu0YwypTr3VZmwBfR08EWfqFuH+SmJKPWJOY+7WH3+1DsNhdhFos+K
	A+dFJQLZ9c7zfJvMUdw1vPzWPLDPA3ZNXQyLhjfNd9DQlmMtxtBy4jTrBLzvGLI5z5tsbKpZ4b/
	UnyGSKPDZwR9sJxLdsi2szEvyknlhzyJpASfwQ7DidL3ucuKSMQ/gOuzNAzcQkAqHuwW7aT+Jgt
	+fkOHiDHBQw/rD1V3nQmjBYvwA4t4idHZntD38CIw=
X-Gm-Gg: AfdE7clbYCd5bKXgL18JBlGO8mdffToVmi+pciDzyswNDmZNJZLaijeO9/km7q+QC1q
	oCnFGGK8yfbXVzlIP+pphQolKvlnjuxiDoJh6UjamjcpYITHN3a71RajW22+HgsQNRehoIG5bkk
	GBae0r5L6CkaXo/zOeq4iMRbJ7F0eEMih6e3QOyB92I/5wzyu1ahsUo/qvvCQU0GVXoGQ5
X-Received: by 2002:a53:bd08:0:b0:667:8b91:242d with SMTP id 956f58d0204a3-6679f245672mr5946047d50.92.1783688927309;
        Fri, 10 Jul 2026 06:08:47 -0700 (PDT)
X-Received: by 2002:a53:bd08:0:b0:667:8b91:242d with SMTP id
 956f58d0204a3-6679f245672mr5945969d50.92.1783688926691; Fri, 10 Jul 2026
 06:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com> <20260703193855.110619-24-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260703193855.110619-24-mukesh.ojha@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:08:34 +0200
X-Gm-Features: AVVi8CefhojPUiWasaXCCjZmJBb6K9Qzlv92c3u5BPoEMYadIduP2fyzpl9La3Q
Message-ID: <CAPx+jO-hkYQoEOj1Jrp7sn5HXYTDbfAG4U5rpNBW2Wue2TZxhQ@mail.gmail.com>
Subject: Re: [PATCH 23/42] mmc: sdhci-of-bst: Use devm_of_reserved_mem_device_init_by_idx()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: rm0rREFOaKLNHlW2IPa9siVUsirxbxBB
X-Proofpoint-ORIG-GUID: rm0rREFOaKLNHlW2IPa9siVUsirxbxBB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX9SJ/XpS/3dfq
 LFxiAVK3LDQnuFUtl8WuUG9XxK1nOGZdk5Tqb9bcTAd2/QKu+eNLccaNlgfwhb0WZiLEKSJtIMs
 fn/Pw4vlB7uey661V2hyl0xYy9JeihQ=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50eee0 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=z_eSG8vRrt57AjWXvbkA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX4OMLwFA1Y3vv
 cUuTS/MmxG/0RHigaagBpzHwP5eR2ymAiyHjyyAD6WePBnkRZg/DoxCpVhAM/hxVks0/D7sXagU
 MOcEa4feABxLXWS+vDTxFMGtWho+AhtLYqZAbRGkTeAH0iYsCs9aj2FpOeLeTX5W+KLu+60vWbE
 JAgR/mPZEOHV8YApAXIPPfNhmS6Ns42Lh+g/pOxrYzvQw11aYfkLlD0o3j4mVcF/I8JQE69GDud
 Fpp1fFZIwvdpJTA24AsRMXgD57r2BzvVTdWtAjn2p06UZaHwkAKb025vHuuara0HiUSjou3Hw4C
 jp6PeseLHDtFH2Mrd4hXdNtYNRTGTF2EUZv+x0mEK7od7qpRb1TMshcSjLgT9COxG9SnofvHh1p
 rOGvgjf8zGMrbcPvSOeW7x9jC1lAGXD+iSbds6SVV2CXNFd3YK0QiiC52Lq7RIx2jSsHbT3ffda
 2PgvI0n0uEiWM30LDSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100130

On Fri, Jul 3, 2026 at 9:48=E2=80=AFPM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> Use the devres-managed devm_of_reserved_mem_device_init_by_idx() instead
> of the manual of_reserved_mem_device_init_by_idx()/
> of_reserved_mem_device_release() pair, letting the device resource
> manager handle cleanup automatically.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-of-bst.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-bst.c b/drivers/mmc/host/sdhci-of-=
bst.c
> index f8d3df715e1a..304554ced690 100644
> --- a/drivers/mmc/host/sdhci-of-bst.c
> +++ b/drivers/mmc/host/sdhci-of-bst.c
> @@ -405,7 +405,6 @@ static void sdhci_bst_free_bounce_buffer(struct sdhci=
_host *host)
>                                   host->bounce_buffer, host->bounce_addr)=
;
>                 host->bounce_buffer =3D NULL;
>         }
> -       of_reserved_mem_device_release(mmc_dev(host->mmc));
>  }
>
>  static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
> @@ -417,7 +416,7 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhci=
_host *host)
>         /* Fixed SRAM bounce size to 32KB: verified config under 32-bit D=
MA addressing limit */
>         bounce_size =3D SZ_32K;
>
> -       ret =3D of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc_dev(=
mmc)->of_node, 0);
> +       ret =3D devm_of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc=
_dev(mmc)->of_node, 0);
>         if (ret) {
>                 dev_err(mmc_dev(mmc), "Failed to initialize reserved memo=
ry\n");
>                 return ret;
> @@ -425,10 +424,8 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhc=
i_host *host)
>
>         host->bounce_buffer =3D dma_alloc_coherent(mmc_dev(mmc), bounce_s=
ize,
>                                                  &host->bounce_addr, GFP_=
KERNEL);
> -       if (!host->bounce_buffer) {
> -               of_reserved_mem_device_release(mmc_dev(mmc));
> +       if (!host->bounce_buffer)
>                 return -ENOMEM;
> -       }
>
>         host->bounce_buffer_size =3D bounce_size;
>
> --
> 2.53.0
>
