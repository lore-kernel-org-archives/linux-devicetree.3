Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C824E06ED
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 18:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361738; cv=pass; b=SQxOSNGMUZ5PemxPGhWiq0prKC+Ehn9l4cCY0rW7A0wrPVtfuqBAMl3nAQY2uYvPKs6RapeRWWVSIVFmhZadbIt3eYST0DdZAh90piLBFwSvcLUsnawAYZWv/HWuTL2jenlzFRO1C5Dh1KLG/CIDJyf74xdkyObX0YFr5ZD5ZXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361738; c=relaxed/simple;
	bh=qe35OzbfSn5jxEUxVU2cmzIGiFHK7xWuk7f7gKumZ4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=db8uZ7w6RdiGOoWCrlBASoZ3akldLptCllYNHWiEGMyCTADgVY9oLcM9vngdTHMBTo8LVcZJFqzWeSrZJLDW/VaS+0pUSmg19KZXjYV7Gkr0Nnf81QbBXvprsMQXDAEKM5sWA2OOJi6EuXnMId/FiDHmrGmaTF6yCs37LMdLRAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSlUeud9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLqMAtOF; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSlUeud9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLqMAtOF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0eCF1363366
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 18:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=; b=aSlUeud9MMrnTvaE
	fBNW17DTlK1pd3VcwQpUk4ojbblR/A1hMmRDFhOv4r5cy3OVu8i2q6RmCi/4vkuZ
	vUfJnemh4SMXjd7YTf5sbLQCTkc017+cBse1LMO1nsJkHCEWniirrH+WKHG39Sy8
	my8Qbas7L+ScsIZTV2pNDMGhJ3LWocXSDZvk5Td6QyumagYlnF3T/M65woH/CUay
	IGqzzkIMWOsK+Mg9kxItyfWdlSbMOxtpgASz+AMsYETe9UpdCinK6WF8DBzpNC6p
	SaGtAz+max3hYXt17goBn1g67FdMVjHnVQNwOXVfg+HpnIOlmupIwqr2msOh/dir
	1yJ5vg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvnsv5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 18:42:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c292c2fc1so287256485a.2
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 11:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361734; cv=none;
        d=google.com; s=arc-20260327;
        b=jGMn3QRaPFDLrYlFNVlprh3aMjCBcnpAbciNdj/fMpSlHFsh5YnKM36mhAmw98e+F+
         jPpTxHd8NzFhaQF2Ykcq9OEdCgheuIynmhQHywR8HxfZAoEbHxERLgehd6dFBPjJNpjA
         gWpbtbmvBso2bYAA3FjwboTJ9y0QKotxuL9CUJd3juxJ39KDinTSBJ5w8h+z0/+hubg2
         FUP7g4SpjXnIm04BDP0N1QK6KGKc3QE3rxBtG4v3SaRIfznak1OG2OO42iaWgvQhzS65
         Uslps/Qbr18Jy0CjGo3ZAkfpZZ8G0zxWZ1amsJEwjxuBYniteT6XxYb4wILzFdJahnc/
         oNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=;
        fh=AInke3kAr7cREbLHNURT8hafzqkTxNuE20rgsw/a0Eo=;
        b=nMcn9y9J7WRbayFoqMGk+tHDeIN41a7SlaiKQLn7+svw1pDn8P4Iv+GJvlhm8gmcqy
         i1O71Y4pX4ikZ9N1UO2ZNJrEQRbc1497LSkIL/n8Lwx/keCY/pbVEJIkHeOPgnRXF4Hr
         zEOMI7IZf8bvdlypu/AxJbkzE0CZAk+PCO2bic/L9zlg0wZ1t203UCl0uJw8vl3hP6tp
         SdvLDFvx6rvM8oBVIaDe/p4qd1EPg6uZO71jxSXHOZhWTzmK2LRP23+anrMC5jdhAgno
         xnAM9zw37ac/iNanB0ktn7LJ0Gzv26SKA9w2aSq2/NGJ95JNd7UecS6P29ElLCbIwmCD
         rE9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790361734; x=1790966534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=;
        b=MLqMAtOFgcfL9/esEM7x6BGxofK86YIE1Fei2550rmKgF1kyAQlJ7ay4c9AMp95V5F
         9yVqR3MeECJxN/rljFLWY8Y8cH/y9dErI1SDMfWjRP2T6c286srna7fLafAgf12jJNhb
         C3dUd0We4dWIfe51+7rlrCq4o4SInafcewYvXgEfvqw032ew14t/HA12/kHlUjnorEzT
         Xk4FEBXlguoF/nQB8KmmRq+ZkQq01LvbBb3469/GB1/ktBO+P5lX7PuPxO2z8L7DaBId
         ZzYTL9r+nufOK+2xNUxp1fhF8PNMKIoObRgTMhZiPFhlIeXx0EXSKM6iKcZYxwBqOAmy
         v8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361734; x=1790966534;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=;
        b=oo4eqOH5yKCI3pJX0C7ai+SxRxr9ZhrxxNDdxLDDeyB0zo3vrxWYdpd+0Ei0gK2QDp
         u74MYL90IVNMMZJOM+RrFJ77A5tJfsjZXLKG/+umlS24Adki54HdFssbupLG7cAQWpQF
         KKPJgKTBjU36DOmmMDCZtTwUyXta0Z5pzwmWgY5uZTtWFjaYpWLwtM/3BKTFZye3GJa1
         UW8QpcdEReZZVuhjNXYm7I2uRGoXUli+HAhIswYcinui7woBmMCCpb041L0deFjDcMK/
         nYR2wlLcAKw2Fja7TDotTFR3cMOEvQnGAqAiqhd7Pqfw+wfhaBtJviPwmjH+Mwjpot8V
         bhkw==
X-Forwarded-Encrypted: i=1; AKwUvBznWsMeFlTAjGBU7mvre/VJgl7p+qJJILY78gR2GV5Ias1P3fSRF4JhS+FZgfKJdCBplWSL8sqGjQDz@vger.kernel.org
X-Gm-Message-State: AFuF++kgIFlsb6WdmH1bV68Tde/jnNGf7hoQ7cJuISs2etOxzIP6Q8QK
	GGZz0AAFSjp2LchWn7o0Is4V6gbMJblaAN9owd7MLf9p1eKj6ZwgmTXn9XgrrJ9XUrCnOvL7TCX
	5UTTru3PEnpuF8DPnNYrjhL8K+3VCVRzImMK1r+46yeEK4tIHMnz7P2e81M1sa2mNpCMUq2Y0n6
	6LPFNEuuRGinVIorkf7OKy7+Uer4+BTHPoylaSJAA=
X-Gm-Gg: AYBFou06XSjp5aMi4RhKef3uVy7wkdyleBC37je30i230YH8pr78cm77groCtF5Biqu
	1vMpaIhpvpwaFAh/gpB6nzcmv3SRCDUM5W7F4xhadSNnV9GUB93DY2DCA3y2JCF0ouob0Pdpq2Z
	m5F+J4UsS7MlF1fHQnuAMRrAfkTVQVP5GV2JX+nHbjFzLPyL8au3hATPSVs+NLUGE0s2CnT46Se
	UIjvm5EnXNH6gxbi8V9267Bi/QZSYl8pmPCGD6PJd8afmrWyjDr0YKWQAzW3GpnZxIWnkh8HOhh
	+ecO33xb1X8NUDio5q4vHW/RJtsN
X-Received: by 2002:a05:620a:2614:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93c43cfd3cdmr614934785a.25.1790361733974;
        Fri, 25 Sep 2026 11:42:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2614:b0:93c:e83:6ba4 with SMTP id
 af79cd13be357-93c43cfd3cdmr614930485a.25.1790361733529; Fri, 25 Sep 2026
 11:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
 <178998281449.889291.7893229102394463283.b4-ty@kernel.org>
 <CAFEp6-2P14MdYJGuH6ygRL4ZKtLnJEj=PVMx2p+b9L1RuiX1dg@mail.gmail.com> <f8815dd7-1e31-4567-8f12-1b2b1dd451f7@oss.qualcomm.com>
In-Reply-To: <f8815dd7-1e31-4567-8f12-1b2b1dd451f7@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 20:42:01 +0200
X-Gm-Features: AclHuK9eWyYSXO1LoWJtwtSLZuLm-A6-I11eiFIWKFJB95hJR5ZP3c6jJQ_Yo60
Message-ID: <CAFEp6-074kS9GO2TFcR69fMjuu7Y2Os68CzWs-KUfmZDYaPZ-g@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 00/10] Support for block device NVMEM providers
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jens Axboe <axboe@kernel.dk>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: a1vIogWOqZdrfLCYH2rmFeM1V94aoEd8
X-Proofpoint-GUID: a1vIogWOqZdrfLCYH2rmFeM1V94aoEd8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA3NCBTYWx0ZWRfX18sAd03KGF4T
 oZrFXljZddk5L22LknCg88oSYs77HH2uoEl9Lho/BZ+2+tny6qyOpOA0KNrnYFzAulkT8r4JkFa
 YPeh4BHvsPNK9SWJSGqU0v0YysOdoRo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA3NCBTYWx0ZWRfXwr4lohyTK2wL
 70Z2n3DSoP8c3miUr5QiRZhufPxmJnyPHzFfQ0QfJ2ZaE7kiJFn6/z+FlTQASnGMuKR2VAvI5Zc
 fJKc/KJYXltZQHfvD3gqacH3+gN/q7EJ/dY3zWiHzyVaVEIFZNTpdzutSx3i8R7HnAJRNoj8o8D
 svnH/z8LL5TQgDRon3qr84fnP4NJFmASQHjHysS1eqmEXHqQhhoZamnWf1BYAj+mIbV6sNAdIwu
 j6Xr5fX2ZKmHApWl58uGsHOWjE315RmEnrxzvD8c+xpQG3T4MZ9uhhxqkkJKJ1I2CYIgl4X6h95
 XHbIZFaRYkldjQF6vVgcgpIHeaLAQKJpcWPxGasFjkNumgBOBeOwjCZBwdiZDfyJOMgGj+7yss9
 VczEyMtmSgoza4M7cUdle7As6yMrn1RJx6NVJatQCbXC+vUa63wTJCWScOlcjv3fmSEEWRIjeOK
 Ci2Pc/VWmpfUnQdSIiw==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab6c086 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=8pm97rweiJCjLsilNG8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250074

Hi Jeff,

On Fri, Sep 25, 2026 at 4:10=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 9/25/2026 6:38 AM, Loic Poulain wrote:
> > Hi Jens, Luiz,
> >
> > On Mon, Sep 21, 2026 at 11:27=E2=80=AFAM Srinivas Kandagatla <srini@ker=
nel.org> wrote:
> >>
> >>
> >> On Thu, 06 Aug 2026 16:38:33 +0200, Loic Poulain wrote:
> >>> On embedded devices, it is common for factory provisioning to store
> >>> device-specific information, such as Ethernet or WiFi MAC addresses,
> >>> in a dedicated area of an eMMC partition. This avoids the need for
> >>> and additional EEPROM/OTP and leverages the persistence of eMMC.
> >>>
> >>> One example is the Arduino UNO-Q, where the WiFi MAC address and the
> >>> Bluetooth Device address are stored in the eMMC Boot1 partition.
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >>
> >> [04/10] nvmem: layouts: Support fixed-layout as the nvmem device node =
itself
> >>         commit: 9c6cab93dcd47c3075d896c777567b9d8f813d18
> >
> > If you're happy with the current state, would you mind picking up the
> > block-related and Bluetooth-related patches in the respective trees?
> > They are independent.
> Should I take the following, or someone else?
> [PATCH v10 02/10] dt-bindings: net: wireless: qcom,ath10k: Document NVMEM=
 cells

Yes, it would be great if you could take it. It=E2=80=99s mainly about addi=
ng
the possibility to source a few device-specific values, such as the
MAC address and calibration data, from the NVMEM area, regardless of
the backend, so no dependencies. Moreover, the ath10k driver already
supports those NVMEM cells.

Thanks,
Loic
