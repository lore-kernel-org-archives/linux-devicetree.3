Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8022DC78C
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217094; cv=pass; b=uSfWmIyrN2PT6zM+Wap26fch7FNd+0hIR9R9fd3iRNM1N73+aGFh2lk5Du2C0PaUf5CctNH+k4Dcqoyuq4QEAXCQRvdIDYlvJkaT4iwtykCMrv60Zn9IY/+aUFSc+6dz/CMdygPcDEJGx3t8P0H+57wMKnKnKwRlyVJcl3qxFHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217094; c=relaxed/simple;
	bh=a0JAOOvquFV2mJKI+AEZWdNC60V924jZEjFC8KAQ4Qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QkgxLAu5mtG+rUgx3r/XJ/4BQFaEu5kKPLSqQp7dc7ltyPzbq80ZdMTnfRhok+jfM4/NZVikBdyzk/eAqwHJ7yjTYYy7EWlNz5piLXf5LkZ8avBHlVh2qw9LupVF3lGp+fZKePYU8q6JzQucy0p8yRfsvSFeZUSAdpJMMlpiIvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xojd0zZn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ksLSBANC; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xojd0zZn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ksLSBANC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZ9sO030875
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t4oV7/+gmA3XnnkjBZpQltV40hAmvUYgobOXd8ETLdI=; b=Xojd0zZnacxDUbYP
	jMkgTl2gStxYOeEaavPZCVOUlq5Sm715/1b5KIsOf2oRBmnq9CjI6ihgngXJQy8E
	N+oBEaYT3xo1xnsNK307OHioXjyLMH8/4R4Zmm148oujz/Ar3k9m4bv365/W9ggA
	Te1reYRkHuVqFgjzoZZAde18kYdykxcL9SM0ciCP0jIG6dB2QGINAwLY4rfRMIzx
	jc7A4gXXQTaAqVI2iaGGYo0kNEEWms0hbPdRqAl7o42YnRfX8FJrB4xeKfv55Hdc
	ZskbsT2ReVY4p49BaEsg9djQI+ENG4CYeSvnfEhaLqN8p3Q3nXJN5WgNmNSlnXUo
	CvUP+g==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe68q0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:18:11 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7ff705a4289so65431907b3.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 05:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782217090; cv=none;
        d=google.com; s=arc-20240605;
        b=ejF9qXe9g5uEsctmoLH0F6SsJbJo069EmddcEaynOipMcbZ2w4tYuElWbHM8Zdfckx
         /NDL2kGUoWG6FNFFKKW+hs1PD44YJ4ZKu4EpihwfXbA3TahzFzBOFP+nr5VbFJaxKu26
         mA6Bw2tO3vWPhAZR1TNS7SiGFwCLl6wBr+0bP4tLLQi0gkvxqwPJxSk/2VIZQO4OwLqE
         msLcRdVhFjNdDgWlCdqTGHlbfGlvEQhhloRGF8x71fOs/AFngxBrjwK8w8W7B8EXgB6q
         NkPHgaEr2wOFdaC2/RKXw+qE7YmOcERDcolIEN6gXelqW87dJV9wjHMoK30SEJHpH2FX
         Ni+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t4oV7/+gmA3XnnkjBZpQltV40hAmvUYgobOXd8ETLdI=;
        fh=AP2qGuHYHTUpyDFBgZ7T8ToPWAz2QJIjvYJawA4MAw4=;
        b=V79A+tGaXmcVaCjME8w/1nw7RZPg4XVYN5PTFXGi+7YkJrUFk+EKMH1kBrTzpN244T
         uIVsiHgOVNCUuzdRY6HappHAfxeXt0D5j6TVHekrGEBuJmW0FnGjuxLXmY4LxlznlMIH
         pAfpmeMPaHqi1csstPa/bzHAJL7vYq836KKlLmvUvrsvpuf95yV0ZjyAS4K6NeAnWklN
         J/Q2/WA1lrh/iTAqUwRe4dx4mYWknEgnqEuEs1Ih8eEc1pc0fL1jzMQ9YkL5F5tHd49m
         B5V9NjBdKr/iJhjzoLhO/V86u3JA91oMe3EBPwa9ZFCAJkMM0Gz5n+wykgI26qrJGYy4
         w5qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217090; x=1782821890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4oV7/+gmA3XnnkjBZpQltV40hAmvUYgobOXd8ETLdI=;
        b=ksLSBANCAoM90cJdnW6CsLbB4NTzptfxRQxaPJ4UEp0JN+Re4qb0g8WxrzTwicC8g7
         tqKxzyKX3mNR/xxobsPpNoQy7bcZS5K6MqzsT7YpusU7xfMMg8AQYih/kUCsAjxHurvt
         u4DwuIsoMelnF8csrxtmI/TS7K8S079gZUssVvO31zI8JAy21J0s9U+ya3TDwH4u/eGb
         kfdq5qJjsd1RHmh6VJYSJNgy2RVnRcOGf/cq7aM2ZGTdIOWExmzt7u2yb4o4fBYXesNi
         i8n43xvbMCXS04syH51J4xczEmQKvptDPlhgOF3zr4GaM6aUQwpclcSRUHFQTF5SIDtW
         QlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217090; x=1782821890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t4oV7/+gmA3XnnkjBZpQltV40hAmvUYgobOXd8ETLdI=;
        b=CwZaLMZrWk2Kx8kIn3mupDUW2UDLkONWzMJK9MUKpC0B8aYQfVgr8CW4022/lWo+yT
         D6v3w6mqdgHE42IsTCeqgLODzKROWJbtXhmdTXzvlTUfrwuzII7rtz2aF9dY9mL3Bli5
         nYHOrIA2c+3+UdtyeFo3cJJ7G/zfEXkzxQZel6Q0MzLa1j6fq4caWJnTc4L0VhfD2LaK
         PKwMkRjHCvjjrUYaammjK92sE/vp4FueMDB0mbFPc9PFaFyFEZUCT41oWDBq7yKwn23c
         4YQVLKjw7nuZ24EMiDJFKGpGc0bm3Zj4y4AxMHSG+aGa2e5fHyuuwscErI7KSBNyZCyT
         esng==
X-Forwarded-Encrypted: i=1; AHgh+Ro9EERmsJUgaGfRIELO+T89/ADz2gDOeZEJkkjkaD64Ebz//87suAQoMWM4uZmENv9EoxB46s9QSc9A@vger.kernel.org
X-Gm-Message-State: AOJu0Yymw/yRrRk8QCNXz3sbgpExVm71h9Bfv4Be9vPrmeM+qh0z/wC8
	oYCVwHZw8rSZg1nFn6/u7kMBwmknxeg//p/2Z/JHUOXlBqIsJzsMelTAVa3dfukgi+MRLlsS0q9
	bUIHuZZKJnfOyL9w23mNzuz0sc3INkic7xJ/ET7HR2hK/ribda1km3sNqw2ktHT2xSCD94g1zsN
	URqB2T8xbJbKkbjcjezIhHbEi3o/TdIzS3oxRCYMLJoCQT3CFRXQ==
X-Gm-Gg: AfdE7ckmZPM8xQRU+TopPXtd7qdQofd9iPUPNBLO2UyJUlkN09EE4q2ba6zXfCzVgrz
	FFQO5Bub1hinE2qwR05phFLNCLdKtNIDv9zY1OsU8y4Lltb6Ir9q+7JrKuelrC0KDFiRjb3ObWc
	5E8rr2bRbgcifiSh05JWQt99UGJSYC6WYTTVS6vnx/0NKRHsBgMHf0+Fzk9IWa1qwLcTZR
X-Received: by 2002:a05:690c:6d08:b0:7dc:4ba:ee09 with SMTP id 00721157ae682-806c44f1e72mr20371857b3.46.1782217090354;
        Tue, 23 Jun 2026 05:18:10 -0700 (PDT)
X-Received: by 2002:a05:690c:6d08:b0:7dc:4ba:ee09 with SMTP id
 00721157ae682-806c44f1e72mr20371357b3.46.1782217089801; Tue, 23 Jun 2026
 05:18:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com> <69d2e4a7-eb2e-42f2-83e4-0d8ca4b62da8@kernel.org>
In-Reply-To: <69d2e4a7-eb2e-42f2-83e4-0d8ca4b62da8@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:47:57 +0530
X-Gm-Features: AVVi8CeqQCSbxlG2O_pG5LG4Cg5aMh_5wPMj9ibxrDHiq7VDf0Z8G8UW2dxLKrY
Message-ID: <CAC-tS8AEJBbUT8bPRPQTTOmgQgCJLr7pxc+7gPxzGeSBYvRWeg@mail.gmail.com>
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: bvEXzi63ZoYWXrM7c2Bhf9siOjw-iNrZ
X-Proofpoint-ORIG-GUID: bvEXzi63ZoYWXrM7c2Bhf9siOjw-iNrZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMCBTYWx0ZWRfX6qN3/f+Y6B3Y
 VNmA+AnUFuoHljqqx74QAB5QMFr8spwZU7B/aTNJAMrfSX5h7n0xCmIYfNFm1i7ARxeQqerG0yb
 T9ST2NJhpD6JMLnB8FkesfFmX8p8LaM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMCBTYWx0ZWRfX6MHT0ZjwrMVz
 B0vFXIkWzm27Y9s/wZH/Pxf72a08kBQTEfUmc2wi1aQXJc6cfgWr7rdTPjhnqMccfJu3Bn1OFR2
 RO422wbLcXjj/0J2LRrjKpRl8gDppWRivgwESjxUT96cih7q1vC9Xuy6+o/7aTSSRBJCZRUe2XX
 Ds0reGcK4hVnruprw1GWQFkyc3UXu8MG3bOCoPENhayLLL9Kf6AK110Xk+201uqNRszYbj8zTTR
 gX8z6qKEb9mHe67WEC9YJAT6WOegH2+4x5AqhtVXyW53QOr2WKdqeGbHSs6zs2HgrZ89S5s76cQ
 BCW20F388FUlVvKNAxQ2wrp0FG1lO3ySX99VHzD6e0pYK7WYefIAfe49LRc5kjpM6nyMOOyCmQr
 Hv6bnzkNrr1NPu6lX0BWmJdik6qgwETK6OzI2hOS0tq51jbHIrERU8l4xojUA0YBru/Drf5I9jk
 KJwGnUno9GoJf3OIQkA==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a7983 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nMCE5c-j9JwJCRtBYlAA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230100

On Wed, Jun 17, 2026 at 1:29=E2=80=AFAM Srinivas Kandagatla <srini@kernel.o=
rg> wrote:
>
>
>
> On 6/5/26 11:37 AM, Harendra Gautam wrote:
> > Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DA=
I
> > controller used on the Shikra audio platform.
> >
> > QAIF moves PCM data between system memory and external serial audio
> > interfaces through the AIF path, and between memory and the internal Bo=
lero
> > digital codec through the CIF path. The controller needs a binding so
> > platform Devicetree files can describe its MMIO region, DMA IOMMU strea=
m,
> > clocks, interrupt, DAI cells and per-interface AIF configuration.
> >
> > Describe the single register region, one EE interrupt, the required GCC
> > LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@=
N'
> > child nodes used for static PCM, TDM or MI2S configuration.
> >
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/sound/qcom,qaif.yaml  | 353 ++++++++++++++++++
> >  1 file changed, 353 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif.y=
aml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif.yaml b/D=
ocumentation/devicetree/bindings/sound/qcom,qaif.yaml
>
> Pl run dt-bindings checks before posting.
> > new file mode 100644
> > index 000000000000..5b385e05a650
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,qaif.yaml
> > @@ -0,0 +1,361 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/qcom,qaif.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Audio Interface (QAIF) CPU DAI Controller
> > +
> > +maintainers:
> > +  - Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > +
> > +description:
> > +  |
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
> > +  CIF (Codec Interface): up to 32 RDDMA (playback) and 32 WRDMA (captu=
re)
> > +  channels connecting to an internal codec over a parallel bus. Each c=
hannel
> > +  supports active-channel enable mask (up to 16 channels), frame-sync
> > +  selection, frame-sync delay, frame-sync output gating, dynamic clock
> > +  gating, and 16-bit packing/unpacking.
> > +
> > +  Note on RX/TX naming convention: in QAIF, RX refers to the capture p=
ath
> > +  (audio received from the interface into memory) and TX refers to the
> > +  playback path (audio transmitted from memory to the interface). This
> > +  applies to both AIF lane directions and CIF slot/mask properties.
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
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,shikra-qaif-cpu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 15
> > +    maxItems: 15
> > +
> > +  clock-names:
> > +    items:
> > +      - const: lpass_config_clk
> > +      - const: lpass_core_axim_clk
> > +      - const: aud_dma_clk
> > +      - const: aud_dma_mem_clk
> > +      - const: bus_clk
> > +      - const: aif_if0_ebit_clk
> > +      - const: aif_if0_ibit_clk
> > +      - const: aif_if1_ebit_clk
> > +      - const: aif_if1_ibit_clk
> > +      - const: aif_if2_ebit_clk
> > +      - const: aif_if2_ibit_clk
> > +      - const: aif_if3_ebit_clk
> > +      - const: aif_if3_ibit_clk
> > +      - const: ext_mclka_clk
> > +      - const: ext_mclkb_clk
>
>
> Also do we really need to specify these 15 clocks even though I use only
> one aif interface on my board.
As an example added all supported clock in this binding, in board
specific DT required clocks can be used.
--Harendra
>
> should some of these clocks belong to each aif child node instead of
> global qaif-cpu?
some of these clocks are interface related like aif_if0_ibit, kept in
parent node by taking reference from lpass-cpu driver.
--Harendra
>
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  '#sound-dai-cells':
> > +    const: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  status: true
> > +
> > +patternProperties:
> > +  "^aif-interface@[0-9a-f]+$":
> > +    type: object
> > +    description:
> > +      AIF interface configuration child node. The compatible string
> > +      identifies the serial protocol the interface is wired for on the
> > +      board. The unit address matches the hardware AIF interface index=
.
> > +    properties:
> > +      compatible:
> > +        enum:
> > +          - qcom,qaif-pcm-dai
> > +          - qcom,qaif-tdm-dai
> > +          - qcom,qaif-mi2s-dai
> > +      reg:
> > +        maxItems: 1
> > +        description: |
> > +          Hardware AIF interface index (AUD_INTFa block index). This v=
alue
> > +          also serves as the ALSA DAI ID; it corresponds directly to t=
he
> > +          QAIF_MI2S_TDM_AIFn constants in <dt-bindings/sound/qcom,qaif=
.h>
> > +          (e.g. reg =3D <2> selects QAIF_MI2S_TDM_AIF2).
> > +      qcom,qaif-aif-sync-mode:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
>
> These should be enum instead of uint32, simillar comments apply to some
> of the properties that have only few supported values.
Okay
>
> > +        description:
> > +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (pulse=
)
> > +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) sync.
> > +      qcom,qaif-aif-sync-src:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave mode
> > +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
> > +      qcom,qaif-aif-invert-sync:
> > +        type: boolean
> > +        description: Invert the frame sync polarity.
> > +      qcom,qaif-aif-sync-delay:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Number of bit-clock cycles to delay the data rela=
tive to sync.
>
> This looks redundant to qcom,qaif-aif-sync-mode, which already indicates
> the delay information?
SYNC_MODE defines the pulse width/duration (Short/Long/One-slot),
whereas SYNC_DELAY specifies the independent cycle offset for the MSB
data start relative to the sync edge.
>
> > +      qcom,qaif-aif-slot-width-rx:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          RX slot width in bits. This is a board-specific hardware con=
straint
> > +          determined by the wiring of the serial audio interface.
> > +      qcom,qaif-aif-slot-width-tx:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          TX slot width in bits. This is a board-specific hardware con=
straint
> > +          determined by the wiring of the serial audio interface.
> > +      qcom,qaif-aif-slot-en-rx-mask:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Bitmask of active RX slots. Board-specific =E2=80=94 determi=
ned by which
> > +          TDM slots the codec is wired to on this board.
> > +      qcom,qaif-aif-slot-en-tx-mask:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Bitmask of active TX slots. Board-specific =E2=80=94 determi=
ned by which
> > +          TDM slots the codec is wired to on this board.
> > +      qcom,qaif-aif-loopback:
> > +        type: boolean
> > +        description: Enable loopback mode (presence enables loopback).
>
> What is this mode used for, testing ?
this is used to test/validate DMA and interface level loopback with QAIF IP=
.
>
> > +      qcom,qaif-aif-ctrl-data-oe:
> > +        type: boolean
> > +        description: Enable output drive on the control/data line.
>
> will this be ever false?
Yes, as per HPG whenever there is point to point connection this has
to be false.
>
> > +      qcom,qaif-aif-lane-config:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +        description:
> > +          Lane configuration matrix. Each row is a pair <enable direct=
ion>
> > +          for one lane starting from lane 0, up to 8 lanes. Use
> > +          QAIF_AIF_LANE_ENABLE (1) or QAIF_AIF_LANE_DISABLE (0) for en=
able.
> > +          Use QAIF_AIF_LANE_DIR_TX (0) for TX (speaker) or QAIF_AIF_LA=
NE_DIR_RX
> > +          (1) for RX (mic). TX and RX lanes should each be grouped con=
tiguously.
> what do  you mean ? can you elobrate how can you enforce this?
intention to have matrix from DT, where each rows are Lanes and in
each row, col[0] =3D lane enable/disable and col[1]=3Dspkr/mic
>
> > +        maxItems: 8
> > +        items:
> > +          items:
> > +            - description: Lane enable (0 =3D disabled, 1 =3D enabled)
> > +              enum: [0, 1]
> > +            - description: Lane direction (0 =3D TX/speaker, 1 =3D RX/=
mic)
> > +              enum: [0, 1]
> > +      qcom,qaif-aif-full-cycle-en:
> > +        type: boolean
> > +        description: Enable full-cycle sync (effective in sync master =
mode).
> > +      qcom,qaif-aif-bits-per-lane:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Number of slots per lane. The frame length is computed as
>
> bits per lane?
Yes.
>
> > +          slot-width multiplied by bits-per-lane.
> > +    if:
> > +      properties:
> > +        compatible:
> > +          const: qcom,qaif-mi2s-dai
> > +    then:
> > +      description:
> > +        MI2S interface. Sync mode and slot-enable masks are fixed by t=
he
> > +        MI2S protocol and must not be set in DT. Mono/stereo mode is
> > +        determined at runtime from the stream channel count.
> > +      properties:
> > +        qcom,qaif-aif-sync-mode: false
> > +        qcom,qaif-aif-slot-en-rx-mask: false
> > +        qcom,qaif-aif-slot-en-tx-mask: false
> > +    else:
> > +      description:
> > +        PCM or TDM interface. Sync mode and slot-enable masks are
> > +        board-specific and must be provided. Mono mode does not apply.
> > +      required:
> > +        - qcom,qaif-aif-sync-mode
> > +        - qcom,qaif-aif-slot-en-rx-mask
> > +        - qcom,qaif-aif-slot-en-tx-mask
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - iommus
> do we
yes.
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - '#sound-dai-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    /* Shikra platform example */
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/sound/qcom,qaif.h>
> > +    #include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
> > +    #include <dt-bindings/clock/qcom,gcc-shikra.h>
> > +
> > +    qaif_cpu: audio@a000000 {
> > +        compatible =3D "qcom,shikra-qaif-cpu";
> > +        reg =3D <0x0 0x0a000000 0x0 0x20000>;
> > +        iommus =3D <&apps_smmu 0x1c0 0x0>;
> > +        clocks =3D <&gcc GCC_LPASS_CONFIG_CLK>,
> > +                 <&gcc GCC_LPASS_CORE_AXIM_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_MEM_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_BUS_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF0_EBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF0_IBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF1_EBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF1_IBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF2_EBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF2_IBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF3_EBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF3_IBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_EXT_MCLKA_OUT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_EXT_MCLKB_OUT_CLK>;
> > +        clock-names =3D "lpass_config_clk",
> > +                      "lpass_core_axim_clk",
> > +                      "aud_dma_clk",
> > +                      "aud_dma_mem_clk",
> > +                      "bus_clk",
> > +                      "aif_if0_ebit_clk",
> > +                      "aif_if0_ibit_clk",
> > +                      "aif_if1_ebit_clk",
> > +                      "aif_if1_ibit_clk",
> > +                      "aif_if2_ebit_clk",
> > +                      "aif_if2_ibit_clk",
> > +                      "aif_if3_ebit_clk",
> > +                      "aif_if3_ibit_clk",
> > +                      "ext_mclka_clk",
> > +                      "ext_mclkb_clk";
> > +        #sound-dai-cells =3D <1>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        interrupts =3D <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
> > +        status =3D "okay";
> > +
> > +        qaif_aif_if2: aif-interface@2 {
> > +            compatible =3D "qcom,qaif-tdm-dai";
> > +            reg =3D <QAIF_MI2S_TDM_AIF2>;
> > +            qcom,qaif-aif-sync-mode =3D <QAIF_AIF_SYNC_MODE_LONG>;
> > +            qcom,qaif-aif-sync-src =3D <QAIF_AIF_SYNC_SRC_MASTER>;
> > +            qcom,qaif-aif-sync-delay =3D <1>;
> > +            qcom,qaif-aif-slot-width-rx =3D <32>;
> > +            qcom,qaif-aif-slot-width-tx =3D <32>;
> > +            qcom,qaif-aif-slot-en-rx-mask =3D <0x3>;
> > +            qcom,qaif-aif-slot-en-tx-mask =3D <0x3>;
> > +            qcom,qaif-aif-ctrl-data-oe;
> > +            /* Lane 0: RX (mic); Lane 1: TX (speaker) */
> > +            qcom,qaif-aif-lane-config =3D <QAIF_AIF_LANE_ENABLE QAIF_A=
IF_LANE_DIR_RX>,
> > +                                        <QAIF_AIF_LANE_ENABLE QAIF_AIF=
_LANE_DIR_TX>;
> > +            /* frame length =3D slot-width (32) * bits-per-lane (2) =
=3D 64 bits */
> > +            qcom,qaif-aif-bits-per-lane =3D <2>;
> > +        };
> > +    };
>
