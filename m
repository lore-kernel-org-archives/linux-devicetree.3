Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0322F46F486
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663816; cv=pass; b=k3gksz21lcZnPgveAqtLlSn+R1aWT0+yiu/L+0oQYmTkX4v1GKGsNFZqya6xRirYvA8ZYqHzcsZyiioqWq8T1vHqfHGU2YL7rREv3nlDGFG2GPL/DBXlSaV5QTIFK06gc204ymgF2JWmILf4R7nXU5VFg0kH28eW7APZ3tZgZPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663816; c=relaxed/simple;
	bh=UrrWucbLkup42OFaKWfPnfbwkGasVfP84MagPNI1G50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHzKuj4JhGbWD16FS/SGWprU7jYn914ejH+X7r6/KromvRC3BoZ5hSYcS6LrVEGn4JUc90wiyY81saQ0gQX4AQsDDTeQWkuNtrjmC8ZFo/706n4BuOfjcvjFiKgbH0qvqj20kPYLGIrDoiZWedndYt434aRR2hK8n2IgjkTaFTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSz7R7mh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EP0AwQVc; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSz7R7mh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EP0AwQVc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAv7bQ1761561
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XvqkCKDCZwmeMaXcFghQ7kb7aCZrtTzb3I560fNPdCE=; b=HSz7R7mhb8BhpTSl
	jPyFXFmfRIhiAciT1fsU/QPbwkwKTK2PngNzPz8ibiqz2V+gc7h2fFW+e6FPyTAl
	XnwQdeBXvCfYzWXObMrLfuETZXu+j+8LfXnLjmGs8LhLpAUzN62jf/8TN1hOhP1Z
	V9bQmiN82xkbVETgp66MmJIVkhRzSjhpY5o1f7Kxr+WHYOFrMXpbuIugsouvmFra
	6V/ooKH9fPnot0XqMZ9H47vS4yK2j0MOrkLZ00jiRN8hHsVevseXjMyj9lOhuujZ
	YgT4A/RVBbUBnCmS5eA0w/znsVA/e1CqBaQ5bYl4G3FIhonkqKl53X3icfOflM1c
	jMuJ7g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g96absh68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:16:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d54187d8b0so58303575ad.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787663812; cv=none;
        d=google.com; s=arc-20260327;
        b=NqvE8vgibBQQFldnulP3M0LQ+K1YJkfs0XpH8MafL78qUl4PSD62eQLdH9DrO+Cboz
         y1xKxtUv9SM/6gAwJRkmhHHEtrZnYBBurb3XwHOOuscQO7oSmYod8ctMNJOaqyQAUXZu
         24rCmvxdkWi4NHtCYG0sp811OkK6gV75l5Oj01Zuw73iNhHK2X3lG02j31ENsyDWy+Ee
         z8LlmWZz3az4TRCwVyPfypNhM6Wgs4vUTuQJg370fZtjrRXN5283G85ET6BbQZ2rtu1p
         xuU+CgQCrACukk+Wj6Cju1U4zEdESYuHOJ9fBRf1ewFEdzepgyFIWCR9dw0GkEFuIITg
         Z5pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XvqkCKDCZwmeMaXcFghQ7kb7aCZrtTzb3I560fNPdCE=;
        fh=EweQ1MXQnm5Ow/7Piz594mBXbYsJQ/QYIdPreek7TDI=;
        b=U8yoym8TBm7B6hroRhNZ0Goio1XAdB18gyBLigDILptP+60+RXzkEfr8Kcreg2OeQa
         nPgrQmy3d3/aJUsJMgIMzHKup/eGz0nrYDywvru6LjOqTV6LNQT1sLUpeLE1nz9883u6
         629nAHBQn1lE8a89pxKsLSmQH0EqufAsRdeStxbueKmysmHYuHcQ21zJr3ukht64pZTG
         aJOvoSfy5yGeO9COezG81hSCxqC4cGTmGwqqih6Df3fKzE5BD7VWtNFUUeCx3WdLrWfV
         2kqIHCwzeVwbaKydrOx9/BihMaItcHS32BeQ/f6ufiwpSOP90TXaU3RxAW+hoZHFOMFa
         VT1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787663812; x=1788268612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XvqkCKDCZwmeMaXcFghQ7kb7aCZrtTzb3I560fNPdCE=;
        b=EP0AwQVc4xE2rEUllhWpY/9egZdHSt+uQHjJnjb/UKkvKfkxz4GrFkR5kOMIrwO1Wz
         D1ojIpl4oxah8o9VRgqKC2269Y58GLJJSzv8nKdbFwwf7YarsSkK0OiELS+GE05JGh+W
         eMAz7m/MebGzZQTtADwJMoImqVS9V3oVA+fBoTebYsxVENbOEgG+x0hUMZB8a67zpTPQ
         mR4gC1hD6iYSJDOi4q1sCqQ83jaR3hSh+CxRSY9Gbs9X3J2gPHB/D/nBwEKiDHnuweB6
         NJcq9xhvs2KPAlTIyASnpTG7LwYqL+MOkWAP8UyrAerhnKjd1i3tcQtNmT9eR9FSbaxr
         hGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663812; x=1788268612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvqkCKDCZwmeMaXcFghQ7kb7aCZrtTzb3I560fNPdCE=;
        b=TkLanYNzqJSKwOubLLxB8LWrKY30lfliXsnwM7OqoH3VWXMbgexZM1sghYzcG+CBBl
         PKd7f0l6ZlsoU1YmlfOhZ+ydgV/BAXYbTkigg6OFJ2n/XPEZCYEnSAM77PVd1HYP0qRC
         R8TajmQaocDq84zgw3JufdqLIonTnDGjFXHtfWT6KO7qBN8wfXLXc7nmRR60v9U/ov3P
         ZDyke4RKvOo1+nQf56WMjnHpz3pKi0ccj3H8Bqdm405yHULkgpGI69wFYDonQi7ivQ+n
         RaOP5gIrKZMqCMrW7a6BM5CE8ymR1SiS88DCsPaKZKxPjUJ1Ubh5WZn69+v9r/cTtCyk
         JsBw==
X-Forwarded-Encrypted: i=1; AHgh+RqiJqkrpXmGMPtCgI7U7ntslznP/BDEO+L917wEwdoyay5R8/99HyLpZrV4d98rAn1iKavXB3ERBghh@vger.kernel.org
X-Gm-Message-State: AFuF++noK+1wMMwzjMlHymYLi8/JtSwcbakYJJVkAF8fU/9hf35L35sz
	od4zOWZemlFeoaLlku3bbb8VGie1nIPwBkIp6RUnobQNSwrk/M+D515vRctrOBh2fnxbJ4j2nh7
	2d6mBLoNB0xeTiXfjUHwpw11rxUodoAAxgN/QBvcEMJh53c2NIiZIlSVjNq+r+fo2iidjhJlEFX
	Au9uuaTVITD/RNmwB8Vsbhf65BXRh1KeR00RhJNqM=
X-Gm-Gg: AR+sD1383aG74TzgxTl1V1p6N7YYWrZ2aH0q0IdrPEQOAgzT+h8qxw1O+TQcv4jiO4i
	Xme7UGsdXth4nTCaF2QImL3iiGrry4sVeqqCg+i3Bq82rYa3i/IrXr2v7biPWSaE4dpjii/hUc4
	TfuxpMh9HMVRe3gbD+aJFmAu0uW0WV1+hGpHIK5NjX0SrzJ815Z8MkbW2rCGM=
X-Received: by 2002:a17:902:f683:b0:2d6:3c1a:85e0 with SMTP id d9443c01a7336-2d6dccfb542mr121198125ad.14.1787663811859;
        Tue, 25 Aug 2026 06:16:51 -0700 (PDT)
X-Received: by 2002:a17:902:f683:b0:2d6:3c1a:85e0 with SMTP id
 d9443c01a7336-2d6dccfb542mr121196205ad.14.1787663810832; Tue, 25 Aug 2026
 06:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
 <20260817160222.3313295-2-mayuresh.chitale@oss.qualcomm.com> <20260818-hunger-module-a44d9716010d@spud>
In-Reply-To: <20260818-hunger-module-a44d9716010d@spud>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 18:46:39 +0530
X-Gm-Features: AcwNN1V9egfNMIH691TkAHArGtQXAw0rOFr0i5eeHAW-N5CIlrbpdAfvtphGjHo
Message-ID: <CAHuiULBGKCqxMzO7f-i0VeuN0nykEaDwzVzq1VtT5VK2LM3eTQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: riscv: Add Sspesa and Ssplcofi extensions
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>,
        Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDExMyBTYWx0ZWRfX8O40qC6R5HWp
 tNbyGYA0+YekrDerpAH6NwwRLCRR8yZDPIingW8VyDnLA9q/71Rcw8W4LvKm6EawWVuyX2iCts7
 ggnuZDtONRTHi3Y8EV0aY+Iuni/ngzrAKa4m91Xu09SA/YGKJRX2p4tV0LwxfpV/YnhEsepXQOG
 Kxz+sthD091dN+skqS1QGPbIQyf9egl4r/dyyOK2mG0awyH6u8uWE6D30r209fB9H/K8UGO7S0f
 J96eqw+S5LkHxCUKxhhVfcI55VFcPxJdJdmXeUR70fXumXkNiiHKFhCIlUjMaypKdlTxGhu8vPb
 z2GujP0h3m+kCV/loCuS09ODoI2sBbBDUTsCKD5cXG9RbG3B3jiABaPDlNrLnXyLHvF4pv/17I2
 vQfTIQvJGk2chHOrxssv1Xg0cKuKgtKL9FfvF1gT/jvprQeEKy+zXcpojJCcTvLCx2N+n3mgiP2
 NnDwAdedd4rWt+cpwaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDExMyBTYWx0ZWRfX+8PWNdkYe1Va
 lZkWEUevX6Z7HtfYOCm8oWOV/9tFtGfMguSxEJnAzYGCkiryVJp/TpNp35JSA88qYmuP2SMtd3W
 XFEjA+hSzWQ/6FYgKoLY2uHLJ3BVKdA=
X-Proofpoint-GUID: chcOPMpJB1gnE8pBrP4mSNRZpds_rcdr
X-Proofpoint-ORIG-GUID: chcOPMpJB1gnE8pBrP4mSNRZpds_rcdr
X-Authority-Analysis: v=2.4 cv=SaHHsPRu c=1 sm=1 tr=0 ts=6a8d95c5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5iWJdViXKeNTBtzVyBoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250113

On Tue, Aug 18, 2026 at 3:05=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Aug 17, 2026 at 09:32:17PM +0530, Mayuresh Chitale wrote:
> > Document the RISC-V Performance Event Sampling extensions Sspesa
> > (Precise Event Sample Attribution) and Ssplcofi (Precise Local Counter
> > Overflow Interrupt) in the ISA extensions binding.
> >
> > Add a dependency rule requiring Sspesa to be present whenever Ssplcofi
> > is present.
> >
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
>
> Why is this series RFC?
It's because the spec is still in draft stage and also the register
addresses have yet to be assigned.

Thanks,
Mayuresh.
>

> Cheers,
> Conor.
>
> > ---
> >  .../devicetree/bindings/riscv/extensions.yaml | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/=
Documentation/devicetree/bindings/riscv/extensions.yaml
> > index 5ffc40d599c0..f316b93754ff 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -232,6 +232,18 @@ properties:
> >              ratified at commit d70011dde6c2 ("Update to ratified state=
")
> >              of riscv-j-extension.
> >
> > +        - const: sspesa
> > +          description: |
> > +            The standard Sspesa supervisor-level extension for precise=
 event
> > +            sample attribution, as defined in the RISC-V Performance E=
vent
> > +            Sampling specification.
> > +
> > +        - const: ssplcofi
> > +          description: |
> > +            The standard Ssplcofi supervisor-level extension for preci=
se local
> > +            counter overflow interrupts, as defined in the RISC-V Perf=
ormance
> > +            Event Sampling specification. Ssplcofi depends on Sspesa.
> > +
> >          - const: ssstateen
> >            description: |
> >              The standard Ssstateen extension for supervisor-mode view =
of the
> > @@ -934,6 +946,13 @@ properties:
> >                  const: smnpm
> >              - contains:
> >                  const: ssnpm
> > +      # Ssplcofi depends on Sspesa
> > +      - if:
> > +          contains:
> > +            const: ssplcofi
> > +        then:
> > +          contains:
> > +            const: sspesa
> >        # Za64rs and Ziccrse depend on Zalrsc or A
> >        - if:
> >            contains:
> > --
> > 2.43.0
> >
