Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81323546CB
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217843; cv=pass; b=X8pZ8EpG3DHyHgiDslZe6OfEnySXwgeypgYhTjIr9ZvefEEHGfR2ckc2FaQu70cIGVJm1tFwCJ26ZyjNyO0l3zH+CTFxOIqrELnKOU5mEJK3gBNZAgoeb+0ZLZ/coys1nOxTB7hBY/SrYVgmGhf5TDycSK6w4fNabUCQ0XdmQl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217843; c=relaxed/simple;
	bh=KqJ9tR9MwbyLMUZlwEX/xSNTx/JemCMTpgM7qmlLJYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uu4EbwXIm8iT4Xbt7d9RmOCPQ4hjyMbZjGoZQiNX+BiRDIZaUHreia7uHybwpdmfG8qOOEbwQDAiF3JSHAMWMTHZYveVcWo3GNxtx4t+rZwO62GrMyhNWds5BGwp2ReQpbW22L7zk22TE2Jt6ZgM8C2vqgNEADWHKPGJtK2hmsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYB6eHcq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggeBtpTY; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYB6eHcq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggeBtpTY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBa3jk4053595
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/F9MuVrs0A1V4OkOG1O5HRm1rsfFqA413eFJZD2SZM=; b=aYB6eHcqzB/b/0pG
	nCdPspOI0ZMFcQSsHfco2vgglQkoGteLxesnSme7Z77+46aCDsq1xRp3pbzErHe8
	Ke8KsH7KR8LjCqQqB6Y3m7f+fJ9+ouOz1rlkOY6JMxzLKdgakDtZTEokfXUhifhM
	iL93tuIAy9aBWYEPZHSEQ579O2tORdzxhJ6IsrbTUkALg+x1f1QCI+WZ5eSnSI7r
	61AWBmlM09BTX89DDn/LwhPjGypY04JS8iqxbBbmL8nuvL/YA1xk5UC4rDMZke75
	+orAQ3ZSGj+u5qnbjYzZaZJJwug1jQ8k6fc61zHH+tCVwZqTbAgZWRtIHaHj+t7S
	76kkMg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9yre5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:30:41 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7ff3b4afa7dso15606547b3.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 05:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782217841; cv=none;
        d=google.com; s=arc-20240605;
        b=Ua47kHoio4gchTqm4RzSnICOzZs4xaBCdwA+cXrRKjj121hHwKLl6BF0Hajff3zXI1
         Wash9gREG7aD8RwJVaJ0auYgizJ22kI7F6KL50n6jxQOsgFreGtmCI/tyZnNRC3+aTGu
         tideM3uVwWM0tM0kwCYDrI19y8o2hxc69ycozcv+Lm05mGpNedaFdhbDuLKiDNiV/xGT
         egTLN+ZwD3zh7sjgtZFyXjEMsYCYmJfQiq+DrpWflcv7qH5M2t2i+ym+d38ssb8oZCG2
         yjLfD+s4B33sWqz8DyZYzY2M1NLafJuhIhBsQBrZw/uACZc5/7d9YbniQbm9u+ftk2Ml
         W4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l/F9MuVrs0A1V4OkOG1O5HRm1rsfFqA413eFJZD2SZM=;
        fh=y2e4GcbC15PDurixNoRg+wO0GFiJ6KYjSSMhzMcgiPk=;
        b=X2HZx12aYUVk4o1cHA4SUe0PzXU2eqOImko8N+/Ev9px/OMh2KlNE9Dl/MIIy948qd
         eB+OhdW4UNjtfLfN6DJNRjNUc56PA475oQh5OXen+2jQCynTgtS6BhKAqd6tC1OoTjgx
         rzTUL/ZEC4jvD7HBW4GD7bkBnu+GFLlGneh21icUJQMikTGNOC4thn8FTWGZaErBvrzp
         qsceqM1X/V55EdPUyXF0GWvIDalkj1bzw6LNyKX6mLkfM/SQ+xOeYyaOSlpuRridFr/E
         SnBmHE4ZpfMtEcdie9GUXjtQuxQcl46Lmx20WqUgloQ7HZBnFq3REk0YDb6CdRo+sdOD
         QgnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217841; x=1782822641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/F9MuVrs0A1V4OkOG1O5HRm1rsfFqA413eFJZD2SZM=;
        b=ggeBtpTYgHSNWkJBBiKVeQQA5o6sY0u8dtaacbZYesSyAuPpsPW11hmsR8ela2uGNv
         /SXB9YdvgAEDQFLWCyr03I8p1M49j4TE0YW5jacat98lDvBAlgpmqRANL3jeLrTbYeES
         j7i17oP/ymyWtUEex6d1aff1NJC1UWV2/w/LLaJRJG2fW9GrsLY+DtU6XB1TmWHN0Cx9
         RVQrcEireIPx4Ibmv3CqnKIJrQks1fZ1ZR4SJLDvYaC6SoiZIsrEt6NScTYYEM85GB1h
         wH0V9CHF8GajMGcuORhoIuJwNzbriPTs6lnrR7NmTdX59tVoIm5ET2RaftFSwX3o+zdL
         D9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217841; x=1782822641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l/F9MuVrs0A1V4OkOG1O5HRm1rsfFqA413eFJZD2SZM=;
        b=KpAu+qKtgVMngR1g9BH031LujYzL58aVhFrixyiLURUZtgJChi5JsEGfEbZsLC2Mcg
         vk0afIbrbyX5O0wIqtupbf0yAihvu3eAAUK23V8CjK9dsaQDvP5wY7hnpeu16JShCq56
         Ig5eaoMGS7pf8CM+0e5zyfYCUuMTDs/01bzaszn1tkxA/jL3CZ8rV+p2b6my99Q2QVBX
         YfmppylxDb3u5zXZp1s8At5OOCwul4GFl91RSqXtucMaFleuZUWBubIBwGq+I9lcotRy
         5171pP4Wqn8K4jr/F+CUrEC7LRmEE//zerphhvGhpDPbV5RQ5nwSqU1ZDUgXduzslS+8
         eIEA==
X-Forwarded-Encrypted: i=1; AHgh+Rpt3N9Iy3P7tahgBCo5NfPt3H1W9U8smH1Sb9wrOlkYi2KGmJfPDywZqA+Ys4WnU9MRtoRQprHfPeax@vger.kernel.org
X-Gm-Message-State: AOJu0YzVhv0+jCpL/uFf9wsN0J13r28+FrzHdONrcwgBD3sg4a8TNcXd
	9Yq4IvqNBupo1NNZnroelmZWQL9iDVGUKISyqT221pQFkkPSMvkt3Pf+hh6L2Ifpk4XYBvm68Kq
	ghlM6k99rZzGphkcWs/11KPevoZJsBHbyTHA+2EX3vO2lSsvcprpPZkLr8QHOiR85iI51FH3Srg
	7aEKlTnMcwjTzi7TNvlNZS9+3cBGcbb/mLBzb4KoU=
X-Gm-Gg: AfdE7ckJ6TCvgMd1Swp8S0Snn9bc7qK0DHw5TFoA0maQLTiciyNsXEl67k12mSo25Zc
	KwFQZlpbhT1zpX0E+D1nUXwEIJ7WfR0a+zCesyXZvxD9CeK3pEMXmWnbdH5SJbFiigHFwZIJHjb
	noQG+OIDwiGON6DmYGtJ0I6FV7P+wZeIThj3rllJeYClFsLi4khM+lWBEp77RGNHCmrYPh
X-Received: by 2002:a05:690c:46c6:b0:7ff:3a40:d97f with SMTP id 00721157ae682-801323710bbmr187404917b3.28.1782217840737;
        Tue, 23 Jun 2026 05:30:40 -0700 (PDT)
X-Received: by 2002:a05:690c:46c6:b0:7ff:3a40:d97f with SMTP id
 00721157ae682-801323710bbmr187404447b3.28.1782217840128; Tue, 23 Jun 2026
 05:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com> <178065883033.3171433.8446753794680185025.robh@kernel.org>
In-Reply-To: <178065883033.3171433.8446753794680185025.robh@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:00:29 +0530
X-Gm-Features: AVVi8CeP8QNIhESCYgjuAS6yT63Uj8PaIaSkaRLC7VCSJ8oFpUWf6gegnGmTHYI
Message-ID: <CAC-tS8B6xFMxsZ=Zqw8Ox+YLLG7XfY1WTDab4aZoopXuRYScHw@mail.gmail.com>
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3a7c71 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mfCsxB9_3l_S4IKQe5AA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: NraTftcfciUZyMjui1pfaCApgMqURaAC
X-Proofpoint-ORIG-GUID: NraTftcfciUZyMjui1pfaCApgMqURaAC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMiBTYWx0ZWRfXzQQtI/B92+JK
 VlXtzr1ng058TnxfXhcCn3kZcLSKpRhRGfZTRe/+TbBVscO+GpUwMuEmdbXPfd1L7saWOCwb7kZ
 8LTxcVdnC2IT7u19QGHQUGUavCcImnsVSCrtG/jT5cEaqPzwLtK/LxNwVFnRkVNEyhvF8RvhOfu
 x3VdvDdVyi1IrLzjkIyBS3h62xq+4O74J3jFZzL41xAAdZz392RlpzKc1rK0WeFdrPoShgCJ0aH
 0atS9h0/4cYX8xPbK/+CkQWSwpp6kpLrud0c4iXxh6ghSjMKBp8T6kJPCJzi7L8QW+uOwUc4i0j
 C6/kHSwdn4/+tQoeMmdyzkAdKfKn9j72sNerH1AmiDskVQ2GeLWxiccnAcb78ilLbZBqbsC3Vdx
 K0p4VzmqnCL5gkIdMssvSqWdyphObpbvIiVXmkIjuZ/OpHdLmyvDvvd/Q3wwnGaoRqnPgxEhtkW
 b2/2XFEiQ2HMkI6NhtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMiBTYWx0ZWRfXwmqP7radxhQ+
 YGE8xNyr0ypDYsqpWE6t3I9pOktruwBrQVINGk8Niz7mIg0hGpGeYqJ5IFWSxdHi11LYAlrjRAr
 5hMxr58R6s9p9hOGKxkzdTLpQE5PJdQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230102

On Fri, Jun 5, 2026 at 4:57=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Fri, 05 Jun 2026 16:07:28 +0530, Harendra Gautam wrote:
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
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/sound/qcom,qaif.example.dts:28:18: fata=
l error: dt-bindings/clock/qcom,shikra-audiocorecc.h: No such file or direc=
tory
>    28 |         #include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/binding=
s/sound/qcom,qaif.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1662: dt_bin=
ding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260605103739.=
3557573-3-harendra.gautam@oss.qualcomm.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>
Thanks for pointing out and sharing the steps, the dependent changes
are also under review,
Will mark that as dependency here in the next patch.
--Harendra
