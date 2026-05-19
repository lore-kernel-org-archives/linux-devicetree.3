Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287FD3E2754
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180158; cv=none; b=V4kN1JjkUI4f/G1WGWzy6ajzOEd5yTPS+ov2awiseS2pn8OpvPdkjFlGcsYD8kY2L4E+uZVhowrccRkC1TWnfQF/XDevoxoqDPfox6qn7T9iGbjUFxHEix6XXneR2Kkn7UtkRP97XSNZ3en3DDfLu3LK4Mvtd+g/QxsjgKRj/XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180158; c=relaxed/simple;
	bh=0m2b/SksJcOAFPjMQPTWeZcO/lplBz+CZOC1BuzElpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BoKI/g8m8r2QclMz4OPhwKs4CxjogY5QGrk6ae0L4DIzWoTFZ07UQCwLZ2XkGJBqiHH4Vb4ghrM7SMLcS5VwD+37Hm1PvRx6hYqndwr/N5BAIebZ9lvzZe6GujZCSYJBImZ+ZNY7j5oQSGikZgP1z5vUl3NnHI3jubnrCZhL8VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVfZs8cJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkFCp6+W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVfZs8cJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AkFCp6+W"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J3I8fA2091264
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kv7IMgrAnrqVIrZvkc8Dgwy+Yh+GluIWmluC1cHmISQ=; b=bVfZs8cJ8RmdGXrH
	oph0ED/BLqIJjiY7JtZzhi9yoO5NaW1fmQKhwTIEGIj/htqUK0NwcTuGkkSq1EvW
	3AlyZB8gtVAQ/mvrTxfnJ/ihQQqFLXqs8LOLd7mSCrFqjd2vNjqRFaTc3V5gZI20
	q6v3Xy2fh45ceXB0Kwvmj46Q1Bj1Abx1QxT38XqusSDb4i36O3aT5mPaedtw8V5o
	EgQXpJlkkCZa6Tdn1/bbCuTeGnjT7wGf8ZYuFX2oT03O1uO5LbZdk5r81zO3kBjT
	t+5dZKypZZV4vvSYEn2PiVd4MPkODdWbsN810czL2CpuzZZMXAvgqouzbKVfkfWd
	3FHLfQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpmn90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:42:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so2756495a91.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180155; x=1779784955; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kv7IMgrAnrqVIrZvkc8Dgwy+Yh+GluIWmluC1cHmISQ=;
        b=AkFCp6+WMyq5BxbmlFPS9QG5t8kmQjTojS3AA+niYakv37XrzY0ATQxj/TYzxSFIqN
         vLP+RsbiCpO+y2s64w9jq1265RcusFlUxDzOeCkaK/tQIPANuxC1OTcJRC1f+x3ZrdJS
         9RgfiUmccjjvV1a9+6EEH1JKPnX+SC30rahcIPjOKQ6HtHSnruQgnnIYRKIEyv4TiafK
         4pKyZw5rFS557nDzJdTPIqsNGFr6GmOYVdouBjafbkM5azsq6lleWembqOFPt8+sBgwx
         GO2Qi5hoEDtD164z5kziX19Vx4Fjm2pI2W59jSOVNNr5VtsvDwp81/NAMIwYZKFgSPFP
         2p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180155; x=1779784955;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kv7IMgrAnrqVIrZvkc8Dgwy+Yh+GluIWmluC1cHmISQ=;
        b=OIKU9CddjQJWnjyZB0Y+R5Z6THmmkX2NaYa0m37Fyxdvxe+c2XVj1Jmz7vFyTDH3ZE
         mNlqqdhbXusnJoH1pN/BgBDw5kJZcVwanHGSUvwt/ycSrOtc/QTNNYle2AHN+40EZ7WJ
         87fhIBb1COMjYluaGGk8wRCiAZg1eIwHiIIzkCNqUvwnaV+4CIoJCV2D7Xdoy1PQk5rz
         ejAFuDhJmvELTNcQu4BIZM8AGs+Vuyy5Ie5M6j4rOcprLEVr06sfdQNwhUR1m0bMNzpK
         jExNhzDgu7nEK/JSsn/kLjA+gyFoc9OkABvGsoYF0VQLM3PQPrR18GSTvOFHJwsjsISW
         dq9A==
X-Forwarded-Encrypted: i=1; AFNElJ8NQtJgRqmFgOdf1uNCyK8YPAlzJ/CdCKnsERCiJsNFQsCImEq0kAScKExrRsSS5cy3EbcGywBklPiR@vger.kernel.org
X-Gm-Message-State: AOJu0YzSCECHK+gl5nHEsw5gLWRt2YaAzJjKBdtzKWVtwc7MsLmlHCgM
	reobxHaAy/AoK3VBt/mRYdy9c4+JMYb+gSptR+01VJxRutT6u7TCYKhaMuE1FpCkLE8PG9/miye
	2zfXakTE52f7sKHV1UDeAV5Vx+dZWCZJdRsaI3f5BcXrnp1GzNglCnfeTv/URPD+X
X-Gm-Gg: Acq92OHVlknVSFhDO36SD1myQR5EfFfKmmUD8kc4viu4tu4DPyLC6D/XpZ5+I56PGf7
	G9r7od2z7Ad6RmRzfOC+qpJbvDm8GlrJC4PSNgP5di28/Y6tnFB+2bdbbp4CJFSdoj9UoRirUw4
	1gSDa5HTtgE5T8Ipeu0Ehxhgj9ppN9SNlVHeNneQWinrPfG/HfxK599NfYycGjLBjujQ8NawbBQ
	UGh4KmnQxJ4aNHDbmy4OkUWZ/QUqgLOT9DKa1qkDHVkeeamxIe1oY0GdJnc1D3u9MjPs3A2YIJz
	kviduaJtFmZjIAlwfjK/VOtPSgOusK6+4EP+DCXQUwzJ9dt+QAuctgOXfU7tBqgP4ZMi9L+1AH2
	3Kz6UGm33uW0Ydjp8OEIaZmMFl1/Whgm1gxwb9fLaBAwblryD
X-Received: by 2002:a17:90b:3146:b0:367:f76c:4cbb with SMTP id 98e67ed59e1d1-36951b97b5dmr19072849a91.18.1779180154991;
        Tue, 19 May 2026 01:42:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3146:b0:367:f76c:4cbb with SMTP id 98e67ed59e1d1-36951b97b5dmr19072809a91.18.1779180154335;
        Tue, 19 May 2026 01:42:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369c4bb4d4dsm3055289a91.1.2026.05.19.01.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:42:34 -0700 (PDT)
Date: Tue, 19 May 2026 14:12:27 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM
 property
Message-ID: <20260519084227.pfkasblfliqyxqxx@hu-mojha-hyd.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
 <CAL_JsqJJ9ma2wTwyrV6AmkGULJk7YMU6qm3Guj+jC0t_-hfV+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJJ9ma2wTwyrV6AmkGULJk7YMU6qm3Guj+jC0t_-hfV+g@mail.gmail.com>
X-Proofpoint-GUID: P07-NsFmUGZKpDR_D8xH3jDwbjDmJbax
X-Proofpoint-ORIG-GUID: P07-NsFmUGZKpDR_D8xH3jDwbjDmJbax
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NSBTYWx0ZWRfX31Mp+r9Jhkng
 o2/6whbHKbVCceKZfVf/WwdLTzCDmGrAuRl7c7VgyZZ56SXHxSqttRHg9wfRdEYZhlUjWUAYnbh
 fd1CJSxJ56juhw68KJIEqXg4epadpa9a8cEsyluyxkOdp+1wgL/m/FWQdHadN34Ezz30TDn5nNK
 LviNutfEGYboExn/ErWA6YSKDTqNuyjrglSNA1Zv4GTasbJsgJz/HP+rXGBxgQJPsnxLiFmO0Wh
 vZk7B+osCJ1AhelDWv74PjG6V5qN2sJoA9NqRYGGbN6SaDloQPrxoaWQoZaQNIJK5PFQWS96MNz
 ImBXhvcrAwgTSFqyjh+O41mpXzrfwLth1hiCU73TbhefPUUlahnAxVvnXTVrGqVpnq6759Xz0de
 7Qeg29TGlocdztqDOjUYux7yEXQv5v1lR72iqmQLzG4i2GCpE/VdehETrr5njqPC0T+mt4+jjGH
 9mOUoDQb5cuI26t/Wlg==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0c227c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HagyCSpqj1WAloSUK8IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190085

On Fri, May 08, 2026 at 07:07:14AM -0500, Rob Herring wrote:
> On Thu, May 7, 2026 at 3:07 AM Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> wrote:
> >
> > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > SRAM is shared between the kernel and boot firmware. Before DDR is
> > initialised on the warm reset following a crash, firmware reads this
> > word to decide if minidump is enabled and collect a minidump and where
> >  to deliver it (USB upload to a host, or save to local storage).
> >
> > Add 'sram' and 'sram-names' properties to the SCM binding to describe
> > a region in always-on SRAM where the minidump download destination
> > value could be written. Boot firmware reads it before DDR is initialised
> > on a warm reset to decide where to store the minidump either to host
> > PC or to on device storage.
> >
> > Most of the Qualcomm SoC supporting minidump supports this, added the
> > kaanapali SoC for now.
> >
> > Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  .../bindings/firmware/qcom,scm.yaml           | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > index 7918d31f58b4..6813081fd74a 100644
> > --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > @@ -127,6 +127,22 @@ properties:
> >            - description: offset of the download mode control register
> >      description: TCSR hardware block
> >
> > +  sram:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Drop. This is a common property though we need to create a common definition.

Did you mean to just drop ref for now? And common definition could be followed later or
create one as part of the series.

> 
> > +    description:
> > +      Phandle to a region in always-on SRAM used to store the download
> > +      mode value for boot firmware to read before DDR is initialised on
> > +      the next warm reset.
> > +    maxItems: 1
> > +
> > +  sram-names:
> > +    items:
> > +      - const: minidump
> 
> You don't need -names with 1 entry and sram-names is not a common property.

Will drop it.

> > +
> > +dependencies:
> > +  sram: [ sram-names ]
> > +  sram-names: [ sram ]
> > +
> >  allOf:
> >    # Clocks
> >    - if:
> > @@ -229,6 +245,18 @@ allOf:
> >        properties:
> >          memory-region: false
> >
> > +  - if:
> > +      not:
> > +        properties:
> > +          compatible:
> > +            contains:
> > +              enum:
> > +                - qcom,scm-kaanapali
> > +    then:
> > +      properties:
> > +        sram: false
> > +        sram-names: false
> > +
> >  required:
> >    - compatible
> >
> > @@ -247,3 +275,32 @@ examples:
> >              clock-names = "core", "bus", "iface";
> >          };
> >      };
> > +
> > +  - |
> > +    /* kaanapali — minidump SRAM */
> > +    / {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        sram@14680000 {
> > +            compatible = "qcom,kaanapali-imem", "mmio-sram";
> > +            reg = <0x0 0x14680000 0x0 0x1000>;
> > +            ranges = <0x0 0x0 0x14680000 0x1000>;
> > +            no-memory-wc;
> > +            #address-cells = <1>;
> > +            #size-cells = <1>;
> > +
> > +            minidump_config: minidump-config@1c {
> > +                reg = <0x1c 0x4>;
> > +            };
> > +        };
> 
> You don't need providers in examples. Really, don't need a whole other
> example for 1 added property.

Sure, will drop it.

> 
> > +
> > +        firmware {
> > +            scm {
> > +                compatible = "qcom,scm-kaanapali", "qcom,scm";
> > +                sram = <&minidump_config>;
> > +                sram-names = "minidump";
> > +                #reset-cells = <1>;
> > +            };
> > +        };
> > +    };
> > --
> > 2.53.0
> >

-- 
-Mukesh Ojha
