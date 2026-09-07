Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AABD476CCC
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781408; cv=pass; b=EiTD1itn6+1b/KzEb6wU145bnyLkO8TSUmO897scYzOmNi+mFrvoj/VB7i2NoYzYOJcGL83gfbW6qMhKUZy6ZY6iXk3YJ6ELbznLmlyRylAxSuhYTSf5oCwcbkojNWX6REk1in5h5IPHu5+1lWhzDvZoonIZ+GCVmYOANyXwjqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781408; c=relaxed/simple;
	bh=Lk0NwkKaKa03nRe9RqScZ5iUpg+oUlAZMRhghfaW/nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+ozU6gAcEtRkkkYCMo6xI1cexhfoJ4ySqXnTdxXYyLKWBqLai5yFMJVYS615+WJV3eLgJ7dxAVhJeb1aKg8AKhiPsek4KJJ4vxhJlaLyu6BwGOp2jUhky1oV+qVIlvZe5x3jzF4RgTSMUPpvelrOZm9e1Qa4a3kD+ClOwk/E7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNnNMXoO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i7Al/KpY; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNnNMXoO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i7Al/KpY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amtpx2652267
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 11:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NrZIDbiaSjZjt2eseMzh7EbAr3X9sRZOrE3kigeE+gM=; b=bNnNMXoOqdD7JNwG
	cqCY3/9uRIX7PheA1DVl6gy3R3mwkEtb1MlRcUfo66B/mNz14ZL/VZlbf2juIhnI
	RisqNH5VH+7qX3IuMfvrJRSGWQCUxqGeJzoTK3afmL+uEyz7ZM2TD8zbh0sQ5wPX
	LeVUAUWqVSLBMsQexiYIs4fYruL5LI2/OB6Y2M9kzCMxDL4XsEL/SIM/17dYL4Y0
	ZGtV0+ZJ48lwDBMtoynXMFK5aKzhCvHguw+YHsLPe+ginpCKw2ZEEIaLa/mudGMi
	ie/6FMtu2vNKg4fA9WH/qOFSSxF7AiT6BMct1l0stZnfhRtD8Aka4qm9O/RNZXde
	Mxs3fw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0f6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 11:43:25 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-86e8abd719aso56863997b3.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788781405; cv=none;
        d=google.com; s=arc-20260327;
        b=mRm6/gEYhBsXxAuI6azU31j9KN7teWK3ZsU4OMthJyGCoR4LCO3ICMcgx3y3N8aFLo
         4s4yQUiGKEgm6hW42Uzk8hX/seQQEBFXNFI0zSW1JPkAnR6U5QukrwG+q1qDBYFlBw78
         eUqlRsjzpiNUbxnWIi84uEF8ovwuoUGCw6XOKA1zTSUSYnCUQSmD9L+UzBgsk+2NbYYT
         LdSh+cuolCw1ntc2pd/ExYWW2B6ePDmu4W5mre30Qwq/76Sat4FBpiRTravgF5H4hE+K
         xUx7QhNb7IFRLMwc1JJzrv8I2JfH5AhPkm1ohuPgMFodycmZQyyRbaSw6Eb+GvPA/XrA
         YaWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NrZIDbiaSjZjt2eseMzh7EbAr3X9sRZOrE3kigeE+gM=;
        fh=EbSWV7sRMWiCb7BYn4F7dtQZd/7OYItJNj24xbSGyEA=;
        b=MO9pSq7Dx/28T9ArSWm+/SGSoF9a/6C/4S7WhukRrFg4fkEGmpFy9CGMFIHAuRJEUf
         UVWqvkx0CgS9H/RUPpsLGnXQrRnHnjLxy9IP671wyttTvFS2z4p1UY32jPDFG2+q0Mef
         msPGUuamALfvGMA4nriXqJYkhf02/4/Y017LDZ8MMiY8ewFEmNYE2Hw8GPq/g39Xk26z
         lYmEo7p1M+0Sa++ZKGQjbMAdy+hbbVGyVX4weoq8yda+mxW3cne2mfeO1+nF6ZeuV/Hr
         BA1SGHNDycG1OyXt8hGeLuX3H+jPDNw2KsdFhBNfcSoVTGticroRDxwNgS4m/TXLIROt
         5jbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788781405; x=1789386205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NrZIDbiaSjZjt2eseMzh7EbAr3X9sRZOrE3kigeE+gM=;
        b=i7Al/KpYwLsH8EjWccZ0SiN6mFdWjVD+yXb5MNW4Q8VfSl5De/CFLFRjDf8GnjrBA6
         jwHWkv+6pbRZE9BBCZb7xnkVJrXNwv7PWWPKimJxRUDVAT+bcwbWk2TX9N8EOaOjOuwW
         SGJ0kL/hn4neuucB2Nqyk0gf51+0KjaalKKnOXvOY6JPEGUKLFcgV5Fc+oZhggznm3eF
         BGTmKIDZLTuvUTPCRu53Gj93uzu3MeI/vtIsjQWi3IFU+TMhJp6A8hqR02Pn85Dnf5yF
         A8W9QQaWuSOzjQqkXjZ15v8V69IwXv2CBrKni+yy4sos3fG7fBj1NDy90VLN1yN1Yc3C
         Ufmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781405; x=1789386205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrZIDbiaSjZjt2eseMzh7EbAr3X9sRZOrE3kigeE+gM=;
        b=YtA6zmTAyRGDpw9GrSNdbVA0Z6HNaITdgTheUTcRCElSSxBVG4HlSTgNoU7zYtheFZ
         rzxTr+QptsYxtPWx8WMrtiEm1wcD1gGYC9j4Vbr51NUqyz3GW3A4ZKM4g1127OUfVID9
         oQiX/5tx2Nx1fha+N2xFmO9NAEpBOQes5Nhpn0ObFM4pYtm7PywLJzmGa3y/Hh7MKPk0
         tiiUjcSc6wXZvocW5rP7q+cK2ynu2FcQ4n08jJiDZNHVfutyIOOFqN7j139oyacjwp24
         DdMvz6K9drEz/5p4kiYsVismaQ1YNHeHDmedRbK9vRMaCmmCW331470T1x6YuivqCnap
         E7+A==
X-Forwarded-Encrypted: i=1; AKwUvBwUpstxwaWTp5R98rSyIDlz0lPEZN6tlc6xDoi8m009mEJUNTS408VeGRC90V+T6L02cSn4hiqOGUje@vger.kernel.org
X-Gm-Message-State: AFuF++lgedxNtHGy+xikY8cnd4NmPfCmJYQNaPKoY3+7E4w4ket/pXMc
	UMfwM6HgLuOwIHQUIvw3Gyo9ib2YDsUtN/kAavvtVq2h84s0TZvQAQgy2NliOqRLSh1ngBHsocG
	RyQTwn8NiKeB02i49XJuLDtTIjTq4QSEr1G0ACmxA92LD8z7hVMqYW7p0Kqdc2S+YkY32MHEVZ7
	BrjtJwdLDkW5R1Tagnfrb+vDzNFHirVJsxAuzDTGc=
X-Gm-Gg: AYBFou3Rjurp5h8Js5qPbs5/FgqKnU2MrWX6+pZJTpJBIO8BgQhzoyvFddHynUvBwLF
	w9xy9nYxfFSuIxMDzY/b/YMoxmj+MwDMjDOU8UeM5GrgITQWjlJ81iBQAoIvN4IqDX+9Mo5CSDp
	JSWCUzx/cIIzf41/ebRcToP3KQAH46Z3QC1SIR3pYFUaYlWWxtNH9Ez98UWA==
X-Received: by 2002:a05:690e:b8d:b0:66f:c774:5b4 with SMTP id 956f58d0204a3-66fc77411b8mr2508998d50.78.1788781404672;
        Mon, 07 Sep 2026 04:43:24 -0700 (PDT)
X-Received: by 2002:a05:690e:b8d:b0:66f:c774:5b4 with SMTP id
 956f58d0204a3-66fc77411b8mr2508986d50.78.1788781404250; Mon, 07 Sep 2026
 04:43:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
 <20260903072902.3870009-2-harendra.gautam@oss.qualcomm.com> <20260907-arcane-sassy-fennec-afc02a@quoll>
In-Reply-To: <20260907-arcane-sassy-fennec-afc02a@quoll>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 17:13:13 +0530
X-Gm-Features: AcwNN1UsMX1CNea8QLmw-zNjeOqK5GIDMUAZZugJotv0LufOcAuy7HqcbyW2-Jo
Message-ID: <CAC-tS8BVw6hbgA82V1mYL_3CG4Jdodr-DQbGfM4FzMMdCLbc0g@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9ea35d cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OIiAh5qXnb9EFUsBO6EA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: dPiYB1FNyjFH3TWy9unHXnR0w7KpvuYw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyOSBTYWx0ZWRfX2pIycbHA/2tL
 7LiQuWx0oK9cVQ8lXCtKRRvdVEzTafx7LmFrP8HmkoODx483FDn+tkXvCwHH2niq37BMlfvZfJC
 6QKvFNHH75F1RMz0ac4c3vAdP6/VmMs=
X-Proofpoint-GUID: dPiYB1FNyjFH3TWy9unHXnR0w7KpvuYw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyOSBTYWx0ZWRfX4HivIq0XWvzN
 gLCQtTirt4lVpg7t/TokQDeL2/WO7uW+PKk8K5r/WCFHRgOSE9VMl4/jhWt49w4cjrFDf1ZfjqB
 aT+e3yM3p+1++awjkOsMWfRbfYNefjyVYTPjOjFwogiykGA3lcaZQCHrnP44tZDiI+rSTKM+Ut4
 fdVWV3PcJG7FFPMrvpXNrzkqEgq+4NvQHKhtEB9PR3mYxUHoUOvd49HmfusxdmO/SPisKsqR/wP
 JpLNa4vuRCP8zytHse7VTwQGAYBGAO4USp8mel/URQ3vBMxkI19ExTexGmda7Mb4/fA704FWOl4
 QOfmvpEJ0WuUxrTCGHR6WnlGAzOKwR3tRCOvp2JBtQP4hbw+VKzwUIJBo/G5Y0hoD8OF4RlEtPK
 T14rJgtGb9bwvXIH8ponODfStUv+iL/k4Lx19iZ+y3MmDNqRuvrXGE2eNePgE1sObMjLSYw7xbP
 o42cKJFD7eggWOsM6KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070129

On Mon, Sep 7, 2026 at 2:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Sep 03, 2026 at 12:58:52PM +0530, Harendra Gautam wrote:
> >
> > Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU =
DAI
>
> Why do your commits have leading blank line? I mean, really, how is it
> possible to create such commit?
>
> Additionally, way you send your work is making this unnecessarily
> difficult for us. Look, does this work?
>
>         b4 diff '20260903072902.3870009-2-harendra.gautam@oss.qualcomm.co=
m'
>
> ? No, it does not:
>
> Looking up 20260903072902.3870009-2-harendra.gautam@oss.qualcomm.com
> Checking for older revisions
> Grabbing search results from lore.kernel.org
>   Added from v3: 10 patches
> ---
> Analyzing 112 messages in the thread
> WARNING: duplicate messages found at index 1
>    Subject 1: MAINTAINERS: Add Qualcomm QAIF driver entry
>    Subject 2: ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
>   2 is not a reply... assume additional patch
> WARNING: duplicate messages found at index 2
>    Subject 1: ASoC: qcom: Add QAIF shared data structures and variant int=
erface
>    Subject 2: ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
>   2 is not a reply... assume additional patch
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 0 code-review messages
> Preparing fake-am for v3: ASoC: qcom: Add QAIF driver for Shikra audio pl=
atform
>   range: d7fead291383..a37de53198ea
> Preparing fake-am for v4: MAINTAINERS: Add Qualcomm QAIF driver entry
> ERROR: v4 series incomplete; unable to create a fake-am range
>
>
> You are sending big patchset, with big/complex new driver, so if the
> process things are not done right, we are not going to spend time top
> look at it. There are other patches waiting where we do not need to
> struggle with such obstacles.
>
>
> > controller used on the Shikra audio platform, together with a dt-bindin=
gs
> > header for QAIF DAI and AIF interface IDs.
> >
> > QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> > interfaces and the internal Bolero/WCD codec. Platform Devicetree files
> > need a binding to describe the controller resources, DAI cells and per-
> > interface AIF configuration, and named constants to avoid raw numeric I=
Ds
> > in sound-dai references and child-node reg values.
> >
> > Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
> > aif-interface child nodes required by the controller.
> >
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > ---
> >  .../bindings/sound/qcom,shikra-qaif-cpu.yaml  | 308 ++++++++++++++++++
> >  .../sound/qcom,q6dsp-lpass-ports.h            |  52 +++
> >  2 files changed, 360 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,shikra=
-qaif-cpu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-c=
pu.yaml b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
> > new file mode 100644
> > index 000000000000..9d0616ac7554
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
> > @@ -0,0 +1,308 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/qcom,shikra-qaif-cpu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Audio Interface (QAIF) CPU DAI Controller
> > +
> > +maintainers:
> > +  - Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > +
> > +description: |
> > +  The Qualcomm Audio Interface (QAIF) is a fully configurable DMA-base=
d
> > +  audio subsystem controller. It serialises and deserialises PCM audio
> > +  between system memory and external serial audio peripherals (PCM, TD=
M,
> > +  I2S, MI2S) through the AIF path, and transfers parallel audio betwee=
n
> > +  memory and an internal WCD codec through the CIF path.
> > +
> > +  AIF (Audio Interface): up to 13 multi-lane Unified Audio Interfaces,
> > +  each supporting up to 8 independent data lanes. Each lane is individ=
ually
> > +  configurable as TX (output/speaker) or RX (input/mic). All lanes of =
an
> > +  interface share a single bit clock and frame sync. Supported modes a=
re
> > +  PCM (short/long sync), TDM, and MI2S (stereo/mono). Per-interface
> > +  configuration includes sync source (master/slave), sync mode, sync d=
elay,
> > +  sync inversion, slot width (8/16/24/32-bit), sample width, active sl=
ot
> > +  masks (up to 32 slots), bits-per-lane frame size, lane enable/direct=
ion
> > +  masks, loopback, output-enable control, and full-cycle path support =
for
> > +  long chip-to-chip connections.
> > +
> > +  CIF (Codec Interface): up to 10 RDDMA (playback) and 10 WRDMA (captu=
re)
> > +  channels connecting to an internal codec over a parallel bus. Each c=
hannel
> > +  supports active-channel enable mask (up to 16 channels), frame-sync
> > +  selection, frame-sync delay, frame-sync output gating, dynamic clock
> > +  gating, and 16-bit packing/unpacking.
> > +
> > +  Note on RX/TX naming convention: in QAIF, TX refers to the output
> > +  (speaker/playback) direction and RX refers to the input (mic/capture=
)
> > +  direction. This applies to both AIF lane directions and CIF slot/mas=
k
> > +  properties.
> > +
> > +  DMA engine: RDDMA fetches audio from DDR/TCM/LPM into a shared SRAM
> > +  latency buffer (SHRAM) and drains it to the interface. WRDMA collect=
s
> > +  data from the interface into SHRAM and writes it to memory. Each DMA
> > +  owns a private SHRAM region defined by start address and length regi=
sters.
> > +  Burst sizes of 1/2/4/8/16 beats (64-bit) are supported with up to 4
> > +  outstanding transactions per DMA. Two QSB master ports (QXM0 for TCM=
,
> > +  QXM1 for DDR/LPM) provide the memory interface.
> > +
> > +  Resources are partitioned among up to 5 Execution Engines (EEs) via
> > +  EE map registers. Each EE owns a set of DMAs, audio interfaces, and
> > +  interface groups, and receives its own independent interrupt output.
> > +  The interrupt hierarchy has a two-level structure: a summary registe=
r
> > +  identifies the event class (DMA period, underflow/overflow, error
> > +  response, audio interface underflow/overflow, group done, rate detec=
tor,
> > +  VFR), and per-resource status registers identify the specific channe=
l.
> > +
> > +  Interface grouping (bonding) allows up to 6 groups of audio and code=
c
> > +  interfaces to start synchronously and align their DMA period interru=
pts
> > +  within half a frame duration using the RDDMA padding feature.
> > +
> > +  Two rate detector blocks measure the frequency of incoming frame syn=
c or
> > +  word select signals and generate interrupts on rate change, undetect=
ed
> > +  rate, or sync timeout.
> > +
> > +  Block diagram::
> > +
> > +    System Memory (DDR / LPM / TCM)
> > +    +---------------------------------+
> > +    |  Circular Buffers (ping-pong)   |
> > +    +----------+----------+-----------+
> > +               |          ^
> > +         64-bit AXI  64-bit AXI
> > +               |          |
> > +    +----------v----------+-----------+
> > +    |        QSB Master Ports         |
> > +    |  +----------+  +----------+     |
> > +    |  |   QXM0   |  |   QXM1   |     |
> > +    |  +----+-----+  +-----+----+     |
> > +    +-------|--------------|----------+
> > +            |              |
> > +    +-------v--------------v----------+
> > +    |         Shared RAM (SHRAM)       |
> > +    |  +------------+  +------------+ |
> > +    |  | QXM0 Read  |  | QXM0 Write | |
> > +    |  | SHRAM      |  | SHRAM      | |
> > +    |  +------------+  +------------+ |
> > +    |  +------------+  +------------+ |
> > +    |  | QXM1 Read  |  | QXM1 Write | |
> > +    |  | SHRAM      |  | SHRAM      | |
> > +    |  +------------+  +------------+ |
> > +    +---+--------+--------+-------+---+
> > +        |        |        |       |
> > +    +---v--+  +--v---+ +--v---+ +-v----+
> > +    |RDDMA |  |RDDMA | |WRDMA | |WRDMA |
> > +    | AIF  |  | CIF  | | AIF  | | CIF  |
> > +    |[0..n]|  |[0..n]| |[0..n]| |[0..n]|
> > +    +--+---+  +--+---+ +--+---+ +-+----+
> > +       |         |       ^          ^
> > +       | TX      | TX    | RX       | RX
> > +       v         v       |          |
> > +    +--+--------------------+  +----+----------+
> > +    |  Unified Audio Intf   |  | Codec DMA     |
> > +    |  (AIF 0..12)          |  | Interface     |
> > +    |                       |  | (CIF)         |
> > +    |  AUD_INTFa block:     |  |               |
> > +    |  - Serializer (TX)    |  | RDDMA: DDR -> |
> > +    |  - De-serializer (RX) |  |   internal    |
> > +    |  - Sync gen/detect    |  |   codec       |
> > +    |  - Up to 8 data lanes |  | WRDMA: codec  |
> > +    |  - PCM / TDM / MI2S   |  |   -> DDR      |
> > +    |  - Near Pad Logic     |  | Up to 16 ch   |
> > +    +--+--------------------+  +----+----------+
> > +       |  Lane 0..7 (TX/RX)       |  Parallel bus
> > +       |  Bit clk + Frame sync    |  + Frame sync
> > +       v                          v
> > +    +--+--------+          +------+------+
> > +    | External  |          | Internal    |
> > +    | Serial    |          | Digital     |
> > +    | Peripherals|         | Codec       |
> > +    | (PCM/TDM/ |          | (Bolero/    |
> > +    |  MI2S)    |          |  WCD)       |
> > +    +-----------+          +-------------+
> > +
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,shikra-qaif-cpu
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: QAIF core registers
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      QAIF summary interrupt for this Execution Engine. Signals DMA pe=
riod
> > +      completion, buffer underflow/overflow, error response, audio int=
erface
> > +      underflow/overflow, interface-group done, rate detector and VFR =
events.
> > +
> > +  iommus:
> > +    maxItems: 1
> > +    description: Phandle to apps_smmu node with sid mask
> > +
> > +  dma-coherent: true
> > +
> > +  clocks:
> > +    minItems: 5
> > +    maxItems: 9
> > +
> > +  clock-names:
> > +    description:
> > +      The first five clocks are always required. Any further entries a=
re the
> > +      per-AIF bit clocks (aif_if<N>_ibit), supplied in order starting =
from
> > +      AIF interface 0 for as many serial AIF interfaces as the board u=
ses.
>
> Who provides these clocks? Your example DTS suggests that another SoC
> block, so how these clocks could be optional? Either they are in the
> hardware or they are not. Hardware is not really flexible.
The clocks are provided by the GCC/LPASS clock controller, referenced
via phandles in the DTS example. The distinction between required and
optional is based on usage, not hardware presence. The 5 required
clocks (lpass_config, lpass_core_axim, bus, dma, dma_mem) are needed
for any register access and DMA operation, the hardware block cannot
function without them. The per-interface bit clocks
(aif_if0_ibit..aif_if3_ibit) are only needed when the corresponding
AIF interface is actually used; a board may instantiate QAIF with
fewer than 4 active interfaces, in which case the unused interface
clocks need not be enabled. All four Shikra AIF interface clocks are
listed in the example because Shikra has 4 physical interfaces, but
the binding intentionally allows subsets for future SoCs or board
configurations where not all interfaces are wired up.
-Harendra
>
> I actually finished here, since b4 diff does not work, I have no time to
> review it further. I might get back to it later.
>
> Best regards,
> Krzysztof
>
