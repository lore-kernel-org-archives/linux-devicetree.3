Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553882E0938
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774490280; cv=pass; b=m33vfAP1A6TuoPM7ejPNc2Vy0FjAcSbDjdpx9ViIAIzD7Xbyoow9iBdrWfTJlty6ZxEps8jGrZPVtvzehQuO1Nnp2n0VkS+yTkwyLFR4k7+bWYjYKic7oGj/rxAZ1HBeXhm4LBdw7xdugT6lZkBevMQnWdxe1/1q84REcnW+vNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774490280; c=relaxed/simple;
	bh=JbtkIIFR+YMr+Upri8lorNb2yUQ00SoNqFhCBGANvU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUsCP42AT2rU7pNkFfUppmkjIKV+Xu51OCEfaSxGLVljFbRpggDDLRMcjN8tTmJO+ts2hfPzgFfOuovAn6evJbPxKgadsxRHMBWOcnxDB98OQdTLvUVOl9havz9gePi79KWFkVHZTFya8U6lTIaHHvErrUg6PfTGu4lMwjQmvQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=auSkxRpq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7U3HWVP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="auSkxRpq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7U3HWVP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q1DALk2432296
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hFvHN9/W5rsfnz1GRstFgWsxKugHwgU9kcq9OWvzcLo=; b=auSkxRpqVKKkkJ8a
	jZ0M41I2cndLgSVRDnnY2T7e1B33EL1O1zcFCGLx5WvpzuE9UdKg1Qs5EVDC6wrh
	X3WnPtFmALcigppiigq0VAfwqSGkOmpDGUb21dETe/h8drwArZXbjVW+YEBYkWBV
	9mO+S0YFMjI87hCvhNsEk7/mRxLYpJTtV3PbpfsqJuU0/2HS/PkUIrRv6JXhWoS2
	Gnjt0TeJUAUCaVdxh63VwZ9yfc4IBqLlIQtNQZjQq4bPbDs/1KyRyeYIqMm+zD8c
	irzIrhEF0p6F+yPXv1ZMVV0v1EwV1e1toJOsRw/yP5qiSYoj4FbxZD1QNCdgbWXz
	PJjshg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mmb53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:57:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0baf3cf5bso6639655ad.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 18:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774490277; cv=none;
        d=google.com; s=arc-20240605;
        b=gffR6C3uVGg6WbDE9NFagSt3+lxbwOA/cTE8xSsOsKfRX/O6A/ipwmJ6H33WutGWvK
         QT9PEJGx0gmgXDoRq7m7ZfwDiQ0vNajq51IjtfJS/5DN5scBTyVB5Afj1QRyGgCKTocN
         BT3PCT9Wq/mgagkEgwvKOSsPR6mYFrLOkzW8YQz6i6+362yT0Y7RB/dwR+EKBbEr5Yw1
         baBYS2OqOHJPg13Hj1fMRfjJB9H7qAyVa5SuU9DO6agFbgpzleEgOc2IZWteX50nrxhC
         sI+T6EWPzqJqsENURmSVbUhf8gktRFmuzYnhKYic7YYx9al+Gezy/a0DLrXJUFr4jrFa
         WDiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hFvHN9/W5rsfnz1GRstFgWsxKugHwgU9kcq9OWvzcLo=;
        fh=JmVUnAkDjf+lyWZTBL4q++BjIETf6/+4BdGsz7uqm+c=;
        b=ZReHQj9yIMboKudOXRAhhn8WVpC1sIDmjnZQAShoBdUFH9RWEIVpccz4J/dPg+xx7a
         szZeGMgOmdVL+S+IcTh3MZ03KRH4REjRbzGcWqAsRArUQGwyA2HwqDYumLQOG5pnTlsS
         7c7dKrJGKF7sDs+kGbbh1MiUVAupp9xVPuwVyZk7eIGwvX0yka+0ps8hYSilwOwli6Gn
         LX7U/ke5VSybBeeRz+zfJXGYGyn9hf1fbrJPQaMtG14tb7KRLOBDQOO0wJkQ/YoiJ4/f
         Y5ZsxfbWc1nN9wDfJ1D4g9sru65IMuBbO/Nz8z3TOzVJksdwAiMeElUi13YcLR/GDAob
         U7Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774490277; x=1775095077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFvHN9/W5rsfnz1GRstFgWsxKugHwgU9kcq9OWvzcLo=;
        b=c7U3HWVPp4/acS5WaGR/l9a/PBQm0Zto5wfVJjD+/U8B/SLhy6+Wu9Uu7cs5WgIAHH
         Gebv+ZtvwQWAj0c/tQYoSKGwyoXTz+/S6B+yGsTiGHZEcg9R3wy9mktxycdGKGG/oMLY
         aKk9YMjtNXB59XARKXqqyKKj/CTcAYA5LqrOCUVCsX0NhfpBSyL/7gHk2hIndI9hKNgc
         TVHK48dZXlgzzzs/my8yrt0Ovl+75Up4jrmZJ2vXTkdECHIoMLcmMieljIYLTSYlJdrz
         ObgE/5vbo1p+v3Bzy5w7NKgx/J8MkwVvvKKsg2BFlQJOVKpeat2OCndL3afRi+grOOU/
         Q+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490277; x=1775095077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hFvHN9/W5rsfnz1GRstFgWsxKugHwgU9kcq9OWvzcLo=;
        b=WqhoMBba29402LnBvEZOx1fZoW26naqdzGOe+nio2mbi9ZUaigovK4DSwJhIUL5sc4
         SusnJP9HKwn389RWgc+OuaQ8eT8pc2KA2SF0RdTVgewHpqS7LlgbiD1GzrZU8l/EY+Jg
         Eu6Aj0RztfRzyhcbeScI/jF3lN8e8lpRzaPrOWgJ+yFyD+t/rYIfg6rPc0I4rGi9TAmK
         iaO4AwcKTTdxm+QUi7VY9hZqoQw+WJ1QhoGWMDScYVa3PNQnIdfgkXP+BraiH457mO/y
         qPImakVKIT3TfTlkUDZ8nzkaNadO1uqY24HL/03GdXNQ3Bt7AYjAlhHrk1BN5F2rDjQ0
         OG/A==
X-Forwarded-Encrypted: i=1; AJvYcCWeOXvSJ3RGmEbk2c12ZaMFMlfZLLLWzfVxDEz+LbWcw4BOgK0ibGeJMR/qJC/icUU1v/sojOEKGCzt@vger.kernel.org
X-Gm-Message-State: AOJu0YxrrQDIrdjliOjFW9TRf9BxrCrrJEIame5hblnbj/reLAvAak/Y
	s5dXCZHy+BvBIEqceP13f1Mkl8gWV0a4ai2oxn13q6Zj+WB3vX68dNRmf8agZgeZh7RvZq/WUpA
	5koXeA1Wcj3DvR9yf42tGBeZhd+uJ0IgybN79pOzjg0oZ5uQcNzIjnNGUQFvVbI6gvnynnnIXuw
	NeACvdT3/rS4mR2wVYK5IWai8WJKT6r8yadeVCN1Y=
X-Gm-Gg: ATEYQzxoS259vkolp4ZFRhNTtthodJOUzbGLX4Lexfr0MFqfD0lJGwMAH7UfGny8pbE
	deHmsFVcY4a7+XwGoEWDnDCG0AtRaZVCJl3e5YNBYQzFDuzGC0+4u0KL6XeEDMhSJCxaVZ0PW/p
	HJctSUpuiq/oQlUYXIc/gzVGHQ2GYTgNSOYym2L/6ClI8/lPSlL2TBcFLaoyUHWxgkFhWMa2a8r
	nxVZ9hUDi/DS4GQiIyJ
X-Received: by 2002:a17:903:98c:b0:2ae:5a38:96bb with SMTP id d9443c01a7336-2b0a4d7f7c4mr93599905ad.2.1774490276678;
        Wed, 25 Mar 2026 18:57:56 -0700 (PDT)
X-Received: by 2002:a17:903:98c:b0:2ae:5a38:96bb with SMTP id
 d9443c01a7336-2b0a4d7f7c4mr93599595ad.2.1774490276134; Wed, 25 Mar 2026
 18:57:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
 <20260324172916.804229-2-elson.serrao@oss.qualcomm.com> <CAO9ioeWxk_=HowH-FcEakL4EXFyAz=dyPwEpqSXPQfvmuvfPHg@mail.gmail.com>
 <fc406873-74bc-49f1-8be2-4b089d0c8010@oss.qualcomm.com>
In-Reply-To: <fc406873-74bc-49f1-8be2-4b089d0c8010@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 03:57:45 +0200
X-Gm-Features: AaiRm50FdCDzTOvo8QkNFmTIKdaOaiursnoEXNalpmkMZcve5JjJ4XHuXDMH14g
Message-ID: <CAO9ioeW7O+arR2VdAZboty_cAdtYm--ppMx9RT3nTQpJbTGccg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_1=2F1=5D_dt=2Dbindings=3A_connector=3A_Add_role?=
	=?UTF-8?Q?=E2=80=91switch_provider_phandle?=
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAxMyBTYWx0ZWRfXxSTwfeB0kjP6
 a57V5TrMP1WwZo/AvVGxdz0/rxd/FhwFduFEQkppCpU7h0F0OYoIwxzdFRHsGCBgCyMm5N5dlk2
 bK3J3e7vhB+W3QYHmrXHVJbuKLPJdO5QKl81Cr26fapMMwS8KoPa7X/y3YSl7kGeWZZR911taWu
 DpjRcecDMJX+/CgyefZXZ+UH/ZVBiTFjr+oEKgVBnflIE8gcVE98xg5Z++/7TEKsvyPl1MYUt04
 ue8JaQIS2nyVPclR4vkgCJ/BEIhiX/LVUyTmm95qEmIxTdIkP3TMlK3555ta49PY++gC8WnEQqN
 75uYkTwA0Ox2vfVTOyUGwbWeUVv5htBiybdPmsGkj5Yoln30Tts4zTMdwfY1OaEOeemnXRuYImC
 gcPtRBo6Ws9yy1uDtmJelKZA4tVVlkTLy0MGcj411QUU/Z/IybylOYakIjzHkGGwwBhsEqSM8cd
 xewvN0xD8nZBsdqmP4g==
X-Proofpoint-GUID: lZtRllC6Tv7bD7-ZkFKtU6DAky_Am2P8
X-Proofpoint-ORIG-GUID: lZtRllC6Tv7bD7-ZkFKtU6DAky_Am2P8
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c492a5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=aCJT46a3uSuxuuHQp3YA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260013

On Thu, 26 Mar 2026 at 03:49, Elson Serrao
<elson.serrao@oss.qualcomm.com> wrote:
>
>
>
> On 3/24/2026 10:57 AM, Dmitry Baryshkov wrote:
> > On Tue, 24 Mar 2026 at 19:29, Elson Serrao
> > <elson.serrao@oss.qualcomm.com> wrote:
> >>
> >> Add an optional consumer=E2=86=92provider phandle on USB connectors to=
 reference
> >> the USB role-switch provider when no direct graph link exists. The DRD
> >> controller remains the provider via its 'usb-role-switch' property.
> >>
> >> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> >> ---
> >>  .../devicetree/bindings/connector/usb-connector.yaml      | 8 +++++++=
+
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/connector/usb-connector=
.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> >> index 11e40d225b9f..ef8d3d26461b 100644
> >> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> >> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> >> @@ -95,6 +95,14 @@ properties:
> >>        - device
> >>        - dual
> >>
> >> +  usb-role-switch:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      A phandle to the USB role-switch provider. The provider is typi=
cally
> >> +      a dual-role (DRD) USB controller node that declares the boolean
> >> +      'usb-role-switch' property. Use this when the connector is not
> >> +      directly linked to the provider in the OF graph.
> >
> > This kind of properties has already been discussed at least twice:
> > - First for referencing the DisplayPort controller from the AltMode
> > node (USB-C connector)
> > - Then for referencing the USB-C muxes / orientation switches when
> > there is an intermediate chip
> >
> > In both cases the agreement was to not add such out of band handle
> > references. The solution was on the software side, letting drivers for
> > the intermediate devices in the OF graph translate and resend
> > necessary events.
> >
> > Previously we didn't have such an issue for the usb-role-switch,
> > because there always have been a direct link between the USB connector
> > (be it gpio-usb-b-connector or usb-c-connector) and the USB controller
> > (implementing usb-role-switch). As with the EUD this is no longer a
> > case, my suggestion would be to follow prior art and let EUD receive,
> > interpret and resend usb-role-switch events.
> >
>
> In this topology, the EUD hardware spans more than one independent
> role-switch relationship, as a single EUD node is the direct neighbor of
> multiple connectors. This introduces additional considerations around
> role-switch discovery.
>
> One practical consideration if the EUD registers multiple role-switch
> instances is that fwnode_usb_role_switch_get() ( which relies on
> class_find_device_by_fwnode API), assumes a unique firmware node per
> role-switch instance. If multiple role-switch instances are registered
> against the same firmware node (the EUD fwnode), the lookup will return
> only the first registered instance, making it difficult for a connector t=
o
> reliably bind to its intended role-switch provider.
>
> Supporting multiple role-switch instances in this model would therefore
> require extending the lookup mechanism to allow additional disambiguation
> (for example, associating role-switch instances with connector context).
>
> I want to make sure I clearly understand the intended modeling and whethe=
r
> these USB role-switch framework implications are considered acceptable.

As far as I can see, you can register two usb-role-switches, one per
the EUD path. then the connector will still be able to discover
correct switch by following the chain from the connector. On the other
hand, the EUD driver can use fwnode_usb_role_switch_get() passing the
path's fwnode and find the next role-switch connected to the each of
the EUD ports / paths.

Here I am assuming that EUD device structured in a way like:

eud {
  compatible =3D "qcom,eud";

  path@0 {
    ports {
      port@0 {
        endpoint {
          remote-endpoint =3D <&usb_con_0_hs>;
        };
      };
      port@1 {
        endpoint {
          remote-endpoint =3D <&usb0_hs>;
        };
      };
    };
  };

  path@1 {
    ports {
      port@0 {
        endpoint {
          remote-endpoint =3D <&usb_con_1_hs>;
        };
      };
      port@1 {
        endpoint {
          remote-endpoint =3D <&usb1_hs>;
        };
      };
    };
  };

};

--=20
With best wishes
Dmitry
