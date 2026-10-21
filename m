Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792569408;
	b=LE82/gUisAS1kApi+F5WutB+jG3nbiZzeizrRua585MIS293bcSI5Zs7vpyAhFNFGo+b
	 +laY5+CpnbZYwO2zDIFXgiBeDpn2I7pqwAm8V1V+DGgibUl/VDBY9GOs2WXEaS3zXKY1/
	 hOdYZjwDnWCV7BbOv9IEE7W+/sOfXtQgvKeqClSpepe9Pf354JGeOnlXfFC1WdrRFhTZB
	 5isTbxUDSfWBSicAng//l+7EKQRgryuUstQCgxMyxRChkkXGdJvzRcLGGhT017D/K8EGd
	 BcyM5A9QLX33xrvedil/dsTsQjxmzVD5SqWThCpTy3QoP3X9hQYJr+wbDhVOhWkgirQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569408;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oIWWxOwnRpq6QbCd8IrW8JOBm2tuiGSDBQ2+EhIn+aY=;
	b=aWTySCBDphyp8qCr+jDgyDWBK9iRgWk0sEGH5Oyt2byyDoTJGf+XaKRIZp4XDSZ3rj6T
	 PsnJooDCvoYWK15j2C4ELbbroHCKvafc39c97J6hEljoneKCrZDFL4UPAAzbmLhq8ev3N
	 C2EOcznU8D0i5Qo4zGbdZmTB6LWwLnytNR3ctYW57gCrFi0PCSD4e9KuGa1ugJVwC4Wid
	 N3NS7bm6ASBkHdDgzGInpNF5wvzJvZXvt2mH4CkBw0RNkSKActRSGZFGItHdZS1RAqZkj
	 fHB7XTTUHxsMID1ZV705gJxXYMD5VCj4P08yj/gpboe2EoZuGUtsetA+pzs/kqQRExg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecVcew5d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECMfjh2K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F51606A332
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21F51606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecVcew5d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECMfjh2K
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j13g3925772
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oIWWxOwnRpq6QbCd8IrW8JOBm2tuiGSDBQ2+EhIn+aY=; b=ecVcew5dxNN4k/2h
	0RYmgVIYj9XR9ah50jv/VbBldcVVw6zbs/CXd/yG3XcGS6W4b7bB+jU3hw2n3Qv6
	3TQtOw6bJ1aZpflwraMX5ssKqb7s0LDOGyA8OQngx4RF7BV1ajmbnlumILuWKT6J
	FfGE6X98vL3noPVId+y+Pm7ODYSl23baYC8sChE8YDbh0PV1fNqQLzIJKCCVg9+e
	mF1thX/NT34kBc0UHCo1vl4lRu2NfZrBMikrimQIlhu5S+IKzJy7hWyLmvO+c+Q6
	f2L+EPdPRsESNwVnfwO3Gkl+4zqUJxj/Xa3QvIZFI3M2G/Z6QQTQxSH7y1OITNda
	MQVFDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2c88x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:56:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so49135485a.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 00:56:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792569406; cv=none;
        d=google.com; s=arc-20260327;
        b=HMMu1aEvauw/BklihJT5rhiRdOKpaldy1xZQmdt0/FD33OXPS7N6h4KQ+f8lg3ZeLM
         waZvVdMasu7Ibz1Fm+WnqBm47fZ7TS9+9NzGI8VE8UotPaHicmxhmFzA0n3sWMU6yhrz
         EG0nZJ9zedFOQ2PwYHsy4hL37i2WtZD0mrWAHjWlkDdOdSP+UZoHsC0lz0lfFRRCVAvQ
         pACO0+jIZsQ9TN0Djxo4Op3jQohsOhlxfAprjA0xtJqbzZcm9ApcM5Eq3pt+IgaFGq+j
         VAaeqSpaENS84rd6DcQpGyrxKnFaF5FjpHzhqiLM0//Oy13Inqb5ohA/n9Ezu0LfLT4x
         UkhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oIWWxOwnRpq6QbCd8IrW8JOBm2tuiGSDBQ2+EhIn+aY=;
        fh=bPmZ21KsBXbHYQcdJxb3sVjRXyKdFOjaRwRoOpzAiBc=;
        b=qCgXkEQrxNm0w0JJMCgMxDmdheEaUlXCdDWFdTm3FMoRVXT0peuLuxYwAsgBmfkMOH
         96yRLOtNpnIRwUs06rFMAzHSVY+Y8UPaKIoPTMIXTi2LKO5UoKIc0TKltOo6nphrvP64
         wZyCEK+Wiv5x06sU1kFwKHFUF95JstS/67fXooSpDy374lNev4ppp+kdCf0hn186tuhM
         doF9fbhBOvgrgX2mqDK2xocyNaqednAOLZu9CCYfRzAJRoWos2aOVNi+m3fZJLWiTD8Z
         qnWrEyq9leUck+hKBGFgrAT9EdewdBClEqh3dO60okSyzciUaGKKaOu9D/6v4f+Z3y5A
         B+/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569406; x=1793174206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oIWWxOwnRpq6QbCd8IrW8JOBm2tuiGSDBQ2+EhIn+aY=;
        b=ECMfjh2KWQ0vOsQePNOAlx8/m7y9l8nYEQKdXOisBYnUujJXJnn5tyPOC1NXmZPv1e
         fAYY24Q/VG5dF/5O9xFoRe8K8KMydWelCI6C4+3bMvs3txN053IA+v0djTlkYINgp/qU
         csjSct71i8nOYHSGGhc/EF59YfP68swnEhKpHpqWiZmXzhod7z9pHRHrXGM9Sug1j0hW
         UrH2qCok8Bw0Wd/jpmea/EUGed5itU2VA0/dgEND+jxvwy3RJ5lb84hU5OfMOfkfY41G
         XyJm1A6PP9AI1lgMItDrWpplKqB2h5MhoOmRhDvfQUv99Tz/Yghrz7ijVdJVEZBZn9Q1
         BHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569406; x=1793174206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIWWxOwnRpq6QbCd8IrW8JOBm2tuiGSDBQ2+EhIn+aY=;
        b=NIBxM6icSJa7gcrOC5kF48luPJ7VU9LJaaANIMlsM4N7YUk+UDk4j0OCXKeAm4TUrk
         EcQoHrl/FnCL9LE3g3in1OhD9RrvKUSGy0tuP/LOr1PHkh8S1dCdCtii+Sw9d8sK4Ota
         LWyLfgEA/WlT1opSEtfg6hJjoYABq7dLEEAhDV8mLa3h35vaHV4IIS3TOOcXkFXXAz8s
         XR7VoMXfk9XaxPRXTPUaZfpUy+qfy7QUEp+aJMaKn4pNuPcuHyvSISPnjAcDv9AmZo/g
         6arHFwbOZ0Uv+ZgeoQvnQH0Homc1TdVhD8DSfzGOtSl26sasXh1R9++SYe0F9qNiogYh
         tAFQ==
X-Forwarded-Encrypted: i=1; AKwUvByqSluaz33FHIFF/f5X6OriyY2qtDDfK6dOnxRNmNulKGHvY1aFOz4v3ScRRqSwGsLvwnIgy+IGCo54@vger.kernel.org
X-Gm-Message-State: AFq9FYL1Han97hj5mhiaqn19RaEKr4x16lPSyZi3DmXo9gEzhD33e9+x
	Fe77x9E4nVrg1iWxq9xBkr9XIB/QWK09CcCDJxlkP1jJcKd8Cs+m0B3LFS/p9jjraFayaoSMpEl
	fooT/Owk+gT5FsLfje63rw6V4cPWsEzhDJsoCA119N33fL8PG2SRtQolVT5gnpEAKkFNGGqYqk2
	9aC/KuSoiavI9WJehKN9DQlPzwCdEe5rhzv5S121IQbnDdMxw=
X-Gm-Gg: AYBFou096xnfElTr+OeyoFraIdui968rSlWiSxMIdaE+Rtw3ecwiJ8VThKyq6v6EFIB
	FS133sMHZmF4zWjKjAHMrTOApNpbzwt+YGNsUL7NgFtbrdE/0aCWdVUVm/oIRtXbJ3D/AuT2Acz
	yYN+s8M+J9jGY2ZCTHKQUWv/l9q/eXJnfdJScGbA+pndQ60Y+GIHIR9iy++wo8Q06C5mcI1Krem
	iwDPhAGtgfZn46mcwQ2lgK4H4e/nZRf+d29ito/uhcWfK4irv0XNGTt3MJDjqoWyiRXYre8OEc=
X-Received: by 2002:a05:620a:2b91:b0:93e:4f4c:b380 with SMTP id af79cd13be357-93f57ebccf4mr265204085a.10.1792569406269;
        Wed, 21 Oct 2026 00:56:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:4f4c:b380 with SMTP id
 af79cd13be357-93f57ebccf4mr265200885a.10.1792569405691; Wed, 21 Oct 2026
 00:56:45 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com> <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:56:32 +0200
X-Gm-Features: AclHuK98k2MczxGrkHeLuzC-J1vF9mCnI0valuaGqqaz9pJgB0ntPucnOeSha1c
Message-ID: <CAFEp6-2d_hpbJnxR4uAzWhkk+h2d6ffkbBWyATKGrJi2E_z7KA@mail.gmail.com>
Subject: Re: [PATCH v21 04/14] media: qcom: camss: Issue stream-on REG_UPDATE
 from CSID
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: l1XOVdVayK3fFjrbJLZpx6p-ILzHn8pc
X-Proofpoint-ORIG-GUID: l1XOVdVayK3fFjrbJLZpx6p-ILzHn8pc
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad8703f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=0Hab3u7fAHnAQfOSGZgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX61lhNPSB85ba
 /LBabzYt2cFbngPSgpeKF85gxHtunuchGAFqJP/jBk7+xy9aOaF4VBX2DVVkbpdPexCsgvX9VyB
 FthTRAKcP+IfYy6OLRK8UgMq7+VCCC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX9ZFT4ExSSROf
 Y63VImQqiHEzwcOLCO2uNX/A4HpwkM+OFusEn3zuAgSRO9g9YfjK1MyAwo885j4KJ5nnW9iJPwH
 /MWP45LHDKU6/R62wkZV/9FrYivHByjt6/FAyW31QObZz2Sqbh8KzZRY+Ud91fwnWCB/EaImf4a
 7y+5z5820//9uJt0+kfgzPQx09LczJ8GtepYSMMiCq5sQ5XAuf4mijq0VRBdLAACtqKH7zYdI/J
 4cYdiacBXh6afowuXcBaI5MfTpA8++Jw7QQZ7vJ4vG/5Q9McWwXjWxAFXxAdSLFhzVsX+tbb6Yc
 yJXzrXxlwMLSVyAdhM1nbghb7YFeCGH0YKBd4gqMeCfuIyicy2m0Btg8nd6ADBlA+p7s8SvSKUT
 r25N3RAXH/Mhite88nNRnm+CMtZzaEsrFBYq0+/0B+fWqhvwQmTYOWAR/uVuJUHa1pHnTC1Ye88
 GD6P4QEDJQHThJ4xjiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210031

On Mon, Oct 12, 2026 at 8:45=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> On stream-on, CAMSS starts the subdevices upstream from the video node
> through their sink pads, so the VFE is started before the CSID.
>
> Starting with CSID 680, the REG_UPDATE is issued through the CSID
> rather than the VFE. However, vfe_enable_output_v2() still issues a
> REG_UPDATE after queueing each initial buffer, before the CSID has
> configured the stream. The VFE then never signals BUF_DONE. Therefore,
> the CAMSS now issues the REG_UPDATE from configure_stream() on CSID 680
> and CSID Gen3 instead. The operation happens after the RX configuration
> and before the RDI path is enabled.
>
> Skip the VFE-side stream-on REG_UPDATE only when the CSID connected to
> the VFE sink pad implements the reg_update callback. Platforms whose
> CSID does not provide this callback, as well as lines fed by ISPIF,
> keep the existing VFE-side REG_UPDATE.

So why not simply make reg_update optional and either not implement it
or nullify it for the related VFEs? That seems much cleaner to me.
If the VFE implements the callback, we invoke it. If it doesn't, we
simply skip it.


>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-680.c |  3 ++
>  .../media/platform/qcom/camss/camss-csid-gen3.c    |  3 ++
>  drivers/media/platform/qcom/camss/camss-vfe.c      | 37 ++++++++++++++++=
+++++-
>  3 files changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers=
/media/platform/qcom/camss/camss-csid-680.c
> index 345a67c8fb94..556cdfef6207 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -296,6 +296,8 @@ static void __csid_configure_rdi_stream(struct csid_d=
evice *csid, u8 enable, u8
>         writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id=
, bool is_clear);
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         int i;
> @@ -307,6 +309,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       csid_subdev_reg_update(csid, i, false);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>         }
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen3.c
> index 0fdbf75fb27d..830c9c818d3d 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -219,6 +219,8 @@ static void __csid_configure_rdi_stream(struct csid_d=
evice *csid, u8 enable, u8
>         writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id=
, bool is_clear);
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         u8 i;
> @@ -230,6 +232,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       csid_subdev_reg_update(csid, i, false);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765..16a0b5663fe2 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -502,6 +502,37 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>         spin_unlock_irqrestore(&vfe->output_lock, flags);
>  }
>
> +/*
> + * vfe_upstream_csid_has_reg_update - Check whether the CSID feeding thi=
s line
> + * issues its own streamon RUP (i.e. its configure_stream does the RUP).
> + *
> + * The CSID->VFE link is created in camss.c for all CSIDs and VFEs, so t=
he
> + * upstream entity of the sink pad is either a CSID (possibly with RUP) =
or an
> + * ISPIF (no RUP). Only enabled links are considered.
> + */
> +static bool vfe_upstream_csid_has_reg_update(struct vfe_line *line)
> +{
> +       struct vfe_device *vfe =3D to_vfe(line);
> +       struct camss *camss =3D vfe->camss;
> +       struct media_pad *remote;
> +       unsigned int i;
> +
> +       remote =3D media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SIN=
K]);
> +       if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
> +               return false;
> +
> +       for (i =3D 0; i < camss->res->csid_num; i++) {
> +               struct csid_device *csid =3D &camss->csid[i];
> +
> +               if (&csid->subdev.entity !=3D remote->entity)
> +                       continue;
> +
> +               return !!csid->res->hw_ops->reg_update;
> +       }
> +
> +       return false;
> +}
> +
>  int vfe_enable_output_v2(struct vfe_line *line)
>  {
>         struct vfe_device *vfe =3D to_vfe(line);
> @@ -511,6 +542,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>         unsigned long flags;
>         unsigned int frame_skip =3D 0;
>         unsigned int i;
> +       bool rup_in_csid;
>
>         sensor_pad =3D camss_find_sensor_pad(&line->subdev.entity);
>         if (sensor_pad) {
> @@ -523,6 +555,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>                         frame_skip =3D VFE_FRAME_DROP_VAL - 1;
>         }
>
> +       rup_in_csid =3D vfe_upstream_csid_has_reg_update(line);
> +
>         spin_lock_irqsave(&vfe->output_lock, flags);
>
>         ops->reg_update_clear(vfe, line->id);
> @@ -552,7 +586,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>                 output->gen2.active_num++;
>                 ops->vfe_wm_update(vfe, output->wm_idx[0],
>                                    output->buf[i]->addr[0], line);
> -               ops->reg_update(vfe, line->id);
> +               if (!rup_in_csid)
> +                       ops->reg_update(vfe, line->id);
>         }
>
>         spin_unlock_irqrestore(&vfe->output_lock, flags);
>
> --
> 2.34.1
>
