Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91403F65F1
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201299; cv=pass; b=RKnB0u4EnhjOpifsvC0988K0YT/bVV6m2/BSH3iGCWNFpkvnET4kX5Hy5FZoNs6tzIA1wIGmseQU8CgzCC5c6ehs9y7+ycGyUrGftHFUqM/H9Su4WWoDP9DQawawgCuoFUt8IoIZ0sZ1uMAdTFVl/hVUm7UjERq9OoWIJc2X//M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201299; c=relaxed/simple;
	bh=wg3EOuAb4No755sn9yN0PY5sz3j7P8zitmFGHuFMk+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gqoasrYZ1KG5DIagooJ018uSHmRhPJmQyyJ1PI/7qWXFkzDMgHtOtIyaLRuyBN51/6DKuiK/g4SxrUsQt8SRbMFOL0+ypkX13l5ZsAXMTJViuvrl1O0MzekpfTPAFm7eXT9vxO8zdAG6RMQUbtGh9UXZ1H889xWC2a4cPrNW+IA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VxAzmjIz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXno1JSR; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxAzmjIz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXno1JSR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9snCv2485497
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wg3EOuAb4No755sn9yN0PY5sz3j7P8zitmFGHuFMk+o=; b=VxAzmjIzetTRzrYq
	bXw61k0o2iYTG3bB0y52Rgt1UGDnFcfVE/yJ+V7MO/u9RvreUYYfNfGir7uBrqFt
	Yc5No1o/Dq2AAZo26WlhTGGFKmFEcDIgI6Aqy2U879taTA8+Tly43ITAPzjfjB4d
	2lRMpQEeARS8e5gPflo+21O2I8olK+t68e4rrBk3iwJgVFr0S/Rg8a6azLnLIChL
	ISVoNRxQN4/KC4GGqT0ISqZ0J7ld311RJ5jk4BBarosegULZ4/ioHVU2qrRqYFNF
	SzOFFpRPWNZszxRha2OiATSINKtdGz5mPttWjpOsJZUYgyfYpL8EP3SsO/cZzBCu
	4lbo1g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feeg1kkhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:28:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e97889ac8aso83080306d6.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784201296; cv=none;
        d=google.com; s=arc-20260327;
        b=kTqebFDFHdAaR6mwUKEiNiaKjLmp/CE0p2Mx5A4rh9CH5eb3+ig2gPVrmoJQq1kwVT
         grHQVDZVGZ01SryhSZvCJFFjvUAmkmjJ1DJStR/HQXP97oD3abYR6fzb9Do6jlSTOm/G
         kTx5XSCdFKiN7o4+QQmogPYyHM4kOmDQdpt4nn0U2zChnFeqz3t4n96qAdduNfdKB9UH
         cfVJ56+efLMXNmIYhBMq2kuR/QZJf4sN7q2+AzGgBF4lt2QNja2SsHjeklVqdvYNqi4p
         /z2ln4+Zo+KQ+rOqFSVMTdmbhnWaiQxE6tPVwvoXIVzi65Kr5/6Ugu6cTtj4RfPBFMNo
         otOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wg3EOuAb4No755sn9yN0PY5sz3j7P8zitmFGHuFMk+o=;
        fh=VcdFzehJA/D0L+uAxa2ITWGvJcEtgJectIOvDyw7K5c=;
        b=gTVApocoByb/Gaeeu0akPBn+u3CJHNlDTK9tfJexHgMeQ+ADEB3BMvgJVK1X64KDe4
         Ge8/46M2QrlIxbIWsKPQ0zZfmuAp287oGbrvNdz2Pcl5JNT5rgWrFgPaSLc5vexVCUYb
         JIR4XSWXerS2GPVvCa66zTTev5oKP/7i6GAZ5jh2uXLCiLLMMlr0LXLnJYb2sMTzU2gl
         BCp0kZxirex3XT3Ns2wf5mdHVJziauxJijQuT1QYJuAESXWskjuMCb0/fE5pVy8Yw2HM
         xzYmmTAIfyxQFEuvKocBUbXPS6gVFxcTAls21v1WP+2FzRFpok9Esi7iajKocqujrn+n
         KY/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784201296; x=1784806096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wg3EOuAb4No755sn9yN0PY5sz3j7P8zitmFGHuFMk+o=;
        b=QXno1JSR/Ej8o5stpSEj8HsErAfQUTGjSokYQmYsbxEkWnK0JEJf7mA1LSOWFJcMhW
         2UToe4210EuUBCY8CSj9ox52tcwKXxS+kzIg2r7jqhsw8iJqXYaWkCs/zAZpTGDp3Z4w
         q8Awxc6cKUeqaZ+mU3uT6ujinBMgUOdF8AelMPXBOJbK+WQ2kPHFgUvISsiDUM/mu5cf
         PNqmJEfaOHj4SsT+t67i045zKSKVno4X4niDSxEwLgWU6yNRCWfdO0J6pUXXK3s0oUiW
         kS4sb6GkR7O7irnwL8zD4N2vjax36Aff4989d/JnJTiT5wZtDxcqaX6RmhyQliI6Hema
         IKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201296; x=1784806096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg3EOuAb4No755sn9yN0PY5sz3j7P8zitmFGHuFMk+o=;
        b=MgjQcqp9kpzP5E/Q3p1W+ztHV5vcs89tyP/X7ZBpBfJLh+bJn6Kb7HAmijwTGG6gls
         7O9dy4BdsrjHpdj+w7aMjQLCOQEjmt4q0wdoqI9s1daT5BNVvdBLSBQQbHJ5xQ+tsqVT
         R7XPypAIfrWzxuHPSqTpIqOJnJKdn32pTEUIMifXam6KVOhXx7Nqgr01uOmzZ46Hr7RO
         1Vz9tJqurC7mtx94jP2TZm2LW99HlxSwUDVDQgSvwHz0he8/mSCzIyQLa+3QYlMfu5Cp
         V8EzTTasxkpSer9w3kSqrSNpfGrsqaoNSmyk/4hxPGRRWHT0VNmWZ5VvHn5knKScLgAT
         uQMQ==
X-Forwarded-Encrypted: i=1; AHgh+RptjOd86DJr/CeofasXpiQVD8Dm1Zg1UnmCgcnNwSC5IdSYbgbnfYVnzy2VIOFWmxLTidE39R3ZLSJy@vger.kernel.org
X-Gm-Message-State: AOJu0Yyja0QoFae9V7itLwqR5oDpEjB9o26Jw6Hzxh9fuSgc7zGYtz82
	6dX/0bkPcUWsagAoD9qaTfVGTJ+sZvPAb7qDca02GveFUtyejeDDecwKB4H5ijnsdV46bneQKTN
	l2iBjz0MeLrFWy2wQdUYIvzTbEYpci2qdkUeo+iWGf9DMcKeH15iGYMWHOtQfw3yWDszDq3/TFp
	YntjMPMjXROnwTt/7n9Jx0Q2OwQpBm5znfTldYlxM=
X-Gm-Gg: AfdE7cmwNhNOf12tSs+TqHDwJ6g0swv3DIqkkTduY4X7Uay/527W3AZRRQOejhcSMX+
	7e64hcS+jAq4MYQnYakEoSwQavsZSAV+nkEuthkihz0IsL0c6wxxT3Rpir8ZJTtL2e6a/ONMPgu
	U51vRaah5TvRGmjq5lsB1KhNdb/bn5plWnC0vzVWrhBV20fpVqIIGQZ+ebKqMB8N0lpqxCuTANR
	k8kaX564+nHlp8s19/dZKymV37BxhdlT/fE95D+OyyopM/Ga/ZZvA2qzWKe07b+XDmBD1ZRD6Nv
X-Received: by 2002:a05:6214:5a0b:b0:8ee:ff2e:c2f4 with SMTP id 6a1803df08f44-9074c70b5e6mr114234256d6.17.1784201295747;
        Thu, 16 Jul 2026 04:28:15 -0700 (PDT)
X-Received: by 2002:a05:6214:5a0b:b0:8ee:ff2e:c2f4 with SMTP id
 6a1803df08f44-9074c70b5e6mr114233906d6.17.1784201295334; Thu, 16 Jul 2026
 04:28:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
 <20260708-x1e-csi2-phy-v9-1-0210b90c04cf@linaro.org> <YSunV_lNJ8xW_y-Aa2psZavniF6mcHJlJipuj1RYWMB8Zb8yLC-gb7eEnk0XMjfwQOneMGsZM5foFKutCNhYqw==@protonmail.internalid>
 <b7baffda-b97c-4b83-8d9e-e381d0289682@linaro.org> <3ab676ac-919b-4a80-8dd6-71dd7f6fe06c@kernel.org>
 <-iN0mG5nS2joxEn49UrxFlORE3R6Ji3HRebfOMNMGnupMIobTBdRDvnwjRHAXHeLmGf6O4JJENVauduwZXwhiA==@protonmail.internalid>
 <b834e9a0-a61c-4912-b57c-36d571938b75@linaro.org> <4d7a0e59-7c34-4557-a475-8cd7fd2ad2d9@kernel.org>
 <CAFEp6-2J0WGF6g0K7s--PxciO+d9MR-SCVnrWJ3u=sgQNwA59A@mail.gmail.com> <c731b03e-b550-48af-b338-37ac53018247@linaro.org>
In-Reply-To: <c731b03e-b550-48af-b338-37ac53018247@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 13:28:04 +0200
X-Gm-Features: AUfX_mzCUaE-2PIDQyd_wAhNS8c7YA5-o4bK-e6AcG3qbxAKGuc-Fck3JEyVR3s
Message-ID: <CAFEp6-3U66hvi0iZrtRbyY3B-uwEap6xDFHFkVoaEBwWhV74Uw@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExOCBTYWx0ZWRfXwF1dAGL8bf8a
 LnzofBxauctMbq2+f13ZzeJmDqn/WUKagCiwTGEcNZWSko+9jQe7VuWgEUb8yW+B91UDR8Vyzap
 TXWe3Ld3CdodKJRghck8x3FAX1fhT1DYfEVcgLjwmzsvQk7LYEOkazrrWzlbfOQNXSqabq0RJdO
 VtHXE855CP/tCL6roChWECXLN1cILiYZLN66sZJiaYFc80rMmw221PJziTiiawI7NRD09T1q84F
 +4kB0P6GIBl4oGtoNz/W/iNfE1bcVw0KwqpSQcB7SxUMKFL6p3Ll1v5jW6GN+b35uF6fg7JKx5C
 IXX3YDlNzaibXQs8Lk6XtFJ/sddr8+yLPAcKqNWtsQrDkEFPAriCgcE/DTSQj5/FHMqz5O1GNfv
 jOtsneti3F4rtYNCOPvw4pRkm6XOuXUvEFbuS9rlSa/I1BNJDxipxX3jcxXnVN8WBcOA9TeZW4x
 W2hJctW6cU50AT0Anvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExOCBTYWx0ZWRfXy77EnkNONOwt
 vEHewEmt6lDgyfvcNVTnQoP1r8d+oo7Y0kRYD8TO2AwCA5ddrDZgc9ahDAgqv+3ai4cTwV68X5t
 /SNefXB7/h4VyPXLFCcwJRHDn/sSjaA=
X-Proofpoint-GUID: gl1pDWL-lZ8KdoM4t0Ps5L59WYyWx2SA
X-Proofpoint-ORIG-GUID: gl1pDWL-lZ8KdoM4t0Ps5L59WYyWx2SA
X-Authority-Analysis: v=2.4 cv=SsOgLvO0 c=1 sm=1 tr=0 ts=6a58c050 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=64qUk99jZ6gqxPINBu8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160118

Hi Bryan,

On Thu, Jul 16, 2026 at 11:42=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 16/07/2026 09:56, Loic Poulain wrote:
> > On Mon, Jul 13, 2026 at 1:18=E2=80=AFAM Bryan O'Donoghue <bod@kernel.or=
g> wrote:
> >>
> >> On 09/07/2026 08:40, Vladimir Zapolskiy wrote:
> >>>> As explained in the cover letter: I'm following guidance from Rob on=
 that.
> >>> Pehaps you've misread a given review comment, because Rob's guidance =
is
> >>> to remove 'phy-type' property,
> >>
> >> I'll just quote verbatim "Perhaps putting this in phy cells would be
> >> better because the consumer decides on the mode."
> >>
> >> That is not "remove phy-type" - it's "move the mode into the cell". I'=
m
> >> shifting this back to the DT schema maintainers since, I take their
> >> feedback literally, seriously and canonically.
> >>
> >> Any of the triumvirate will do, Rob, Krzysztof or Conor.
> >>
> >> Absent a different answer from the DT schema guys, v10 ships with the
> >> consumer deciding the mode as per Rob's original guidance.
> >
> > On the #phy-cells question, IMO we should drop #phy-cells to 0 and
> > derive the C-PHY/D-PHY mode from the endpoint bus-type. The operating
> > mode is really a configuration of the link rather than a hardware
> > description/limitation of the PHY block itself,and the sensor endpoint
> > is conventionally where the bus type originates. I guess this costs us
> > nothing on the driver side today, we only support D-PHY, so the
> > mode-check just moves into the endpoint parsing we already do in
> > phy_qcom_mipi_csi2_parse_routing(). It can be a minimal
> > fwnode_property_read_u32(ep, "bus-type", ...) sanity check and adding
> > C-PHY later is then a one-line case MEDIA_BUS_TYPE_CSI2_CPHY
> > with no DT ABI change.
>
> So I take your point on link-type - in theory you can select the mode
> from the sensor @ config time. The established practice is that the
> consumer decides the PHY mode, so if we wanted to make this a _runtime_
> configuration - then that should be information that is passed to the
> PHY via configure() not via DT because we've said its a link-mode
> abstracted from the DT entirely.
>
> In the extreme case I have a user-space utility selecting sensor mode,
> which the CSI controller parses and then signals the PHY to switch modes.
>
> If its a run-time config, then its a run-time config and DT should be
> excluded from the mode selection tree.
>
> I'm in fact willing to entertain this idea - but it will require passing
> the PHY mode to configure() not consuming - DT data from the endpoint.
>
> My core point here is both acknowleding Rob's point the consumer decides
> the mode - and _if_ we go the runtime configuration route, then actually
> making the selection @ configure not at probe/dt parse time.

I agree this is/could-be a runtime configuration/negotiation.

> I just wonder if there's any real upside to all that additional work and
> delay/churn.

There is no really need to support runtime configuration as of now
since we only support D-PHY, so the delta for v10 *should* be tiny,
either a bus-type sanity read in parse_routing(), or even nothing at
DT parse and a future configure() branch when C-PHY lands.

Regards,
Loic
