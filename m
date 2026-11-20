Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163472;
	b=dA5ClfAJMnn2CdnwyQTO/eSr+Ia8VZb2YfZ5Wl6CEB8Rbw4+7xVri5WYV7g5SVljN9K/
	 O8Igkude0IAdFl+ZJuRxuqVQNwz5Xl0mV2h6Xml58akE0f5FpCdJuuyKom+vGeJBZfW20
	 s0M3ckU0sPBG5FtHxwxI0LtqpLTQLwxCmEaoBFaCDRn7QY0dB07BWHkKeo3ghKJIFnLvc
	 gx3zTyqs7RoHekoLoFORcf0pHiyKR2onvEynywcKkno/6o8j7KumX2GX9aYODhb2EXh7n
	 1TuD9hNP02/kKY28kCGjm1m9PDVdQ8qO7NYadrbmTdDgMlAZC3V/p5P1elGubI9ZdlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163472;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
	b=2w9regeMCj2vxVwjylZcqU3+rAl3S+9BG76Sr6TpBFl38oxhLD7FkWXeC5M7Qlzy5VYy
	 LgUW254YYAHRaD5lxPm7XAT6HNLH+iXe4qndmw5jeflWNdfCjKrbywMRQ6tG4LegLctIR
	 MHWa99ThgDD3XtBSOO6H4IlEFGRbEiEGy/NevxMsTqxIHnEkQMs+bwLGL+pmGOxepFXjK
	 6Wbjk/UUgQU8G38GXa7T3C0zty2QYzePs02d7CRRIWiDtN18h3NOsKLjRg5IvzKWO/khF
	 tDfIoVrU9bHjkthJ4S4EQ2k0gzlT7H7Amb5jGjJIvEYtY+bFdHkgJfcCwZi/YH46SKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LU3Y3XD1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Py8Ekl9I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5632606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5632606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LU3Y3XD1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Py8Ekl9I
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f7BA1112541
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=; b=LU3Y3XD1hN5TD/oQ
	pz6hWJygeLPcb9SMWjd+b1jhQYq1E+SCUds4bO5A5I5/r+64PMwci6GVVLVHnJDc
	YHttmuQ4yepW1NYCQ9XNTNheIdJULK5hfkYwwRxXYZzz9yFtVEChw8ApvIyTwOPw
	XqgcEcRDQC+vhnD7uMBX8ToyWGOZp9xPdICJj2zs9iFq80ZmcBhK04RdWAU4qShY
	gwGIiXb2BKdLnte9LCJ/RED9pBr6ZiqlVjh5GqPdQn8Xdo3yf9b1zJQQrOcyyxeZ
	9GqamWgzZlYJ+N8MEhuGoUZKzn0QnbXI1K+z+39bT+WLOZEC1RuO2JII48lv5fRO
	vK02dg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtru19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:31:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so137084785a.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:31:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163470; cv=none;
        d=google.com; s=arc-20260327;
        b=mGgtIozLjoTdnRSe5UPBiz7KQGqYy0s3/8YfOtu6UL7vuVTg8GdccV22rSWs/5NJbT
         Be48CdXGNMMj7m+p7V2P5suXuIyZvx8AuXA1f0IYi3L+TCyXIHfJdbcl5t9MoKx4CTfu
         HRNcMgRQh4M7rGyPb5IMj/FO9OUbUbuvLcfB0cqkgRvrVedsgWh3Rp9szgpirXnajxjr
         UiAmKO9HGAALAAd30q24sspcGFaockvQ8e53BrcqVGpmaX/WX88psWhTEQ/No/m+6iC5
         2+kCy2nKERGJ0H2HTe766IvBugs0gA4h7RWFquKr6UkQ3w4KuKH9uNIFzDG6vlNnUBAc
         cdNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
        fh=vvqVjQdQNeMIO7HOSQxgQnN80tHHgbkyVy5CtUnjp4s=;
        b=brs3h7YbM5Db5XLtGewWyEB2dNr0VGq7iupdkFe3HsRRPY1JNYyCtAAu6RLhilymuS
         zfmB7grfFEQSPs1TjLZCXFlo5A6jmX87oTGrPc6pK2+/DPLMsGRYKoVsh3a9GINmLTJ8
         O+3ftUmvuEqHJP2xs8LHuFqme8vhmcpjYbOEL1d8YGzn2y+JeemOgdUbXMtYz8otHjj5
         s2Db1CBnVGNkVfddkqSxsOPGAELD/eKf61d3ejw9ninOyP0VfTu+KsS2aTIqQADRnZxm
         K95EmY22Yq7nT8KwGA820nluBm9ZBKDsWtgTDleitsRsJdFGTaaOLXE0I3pGCbGXFm1C
         ek7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163470; x=1795768270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
        b=Py8Ekl9IfA7utoB0tDdW4cpxXAHzKw0Gyh6IDpWmT8EmgVSp2OiBfPp7H/yrqjbP80
         wiY5EFNEpvWT5MH1SgRtPVfbqPXz7ngDWkdLCIQApz3rZaCp4QHVwEONbsxvBhRo7yIW
         3asJ9sr0bFo40+eLjJFQ/MTCjo9Z7VSVCr5VqMhyEbmDnjkBfM+JpgTumLAHYFAmp1L3
         7zs2dy/AhSdxx0NpyqGK2kyP3xiG4cnUZBn/vWii/ld7Rexq2zHx85nbJ0koJ2qlwd0e
         22cCvjw23HJxgK0SqSTaMJHwU/4+yGtC1cRZcT2EBawVd7H1O8PtLkyrY+OyAieiqZxN
         xzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163470; x=1795768270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
        b=xGKvOshiMxTLspUEn9ay0Wlp9oV1FS2N0JuwgGPSl0FdIpOAGxWiwbsHwJR2/0KMRR
         wrSlA/Lhcg6a6q8EMRLbohrE1hGMGWlRZURL9C2TUYgGGQZUYs6cUZ8a/6UV5n38r2wd
         IjTJzBEs+xVcVKUSwV++MCJqShDFB+b/8D15IeZj9t5C1H6BY08Q/bTx+b16eq82kW0B
         iKUTkan2vooXRiefZ9QlhsJjhMV8UjDhBwDUGcyzJ3bS2jOGgY3h8ZyedkSyDvzYdD57
         LmYiLdprZrDk99rY/mFwIXo0PKVHzwW2vUAJnDZmB4GjP7BvBHqvCOrBRg7iJJel+Ahd
         cO+A==
X-Forwarded-Encrypted: i=1; AL+hErFXL1I4RJguWEkNLVKuHL+NOsmiipPtYD/G2hobC/3H42qimmUTlxlfPbhBNwA8XDOLvhKI0FfKYL1Q@vger.kernel.org
X-Gm-Message-State: APuU4Z+GynmOI2KavxYBgG1sujWkPDSXqkOKsMEyY6vymRVz4zSuullS
	0HdU6nWHMr3vWkiRM4otcC42RTDYKFV7L2iTkvUUdPCpy1mum83GzU6J2YgyeXhG8GCD9h+h4Z0
	RdG3dBchcxF2yyp00JIDp7ChxbqUzxAfEq1zD18IqbsKQ+mw12FzRHvD8pLAcqUYAf+jAb/cyNM
	PypTslN0Ir5Gq4m7dCngnga2x95MMCPgMvcET8UGA=
X-Gm-Gg: AYBFou0vrdqSeaLuSUGzozaugh4AIjX7m2hQJSpty+dfdUng54fXQfxSeXKqkhnSOt6
	hEEHFrzI0/Os4uu2kwRGV3sIcuPpUa04s7i+OqoPoqR7URIzAS+CXXbrQ5mgCKtdUClOUKwm9YT
	s63nK7oLWuAnY/0JmWrac+zogt583JgSVhqMsO47E+95extzNcnY9PU6NSsfvaIbLupZmbetbbO
	wb3dIFtNlIgUzY2fnWAZWNPa0xF67GSHKK45bj0bSqZRV91+GhRbk6yuQnsr9HdVkHcaXwz3YPV
X-Received: by 2002:a05:620a:880e:b0:949:6775:4713 with SMTP id af79cd13be357-949ba8236d5mr338132485a.2.1795163469918;
        Fri, 20 Nov 2026 00:31:09 -0800 (PST)
X-Received: by 2002:a05:620a:880e:b0:949:6775:4713 with SMTP id
 af79cd13be357-949ba8236d5mr338129185a.2.1795163469416; Fri, 20 Nov 2026
 00:31:09 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com> <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
In-Reply-To: <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:30:52 +0100
X-Gm-Features: AclHuK-2t8-3AjSOfc5mzRVYC-Pl0iOAGyB7DrYCV7YVpEsHwSudVmzm65JQBp4
Message-ID: <CAFEp6-1HNo5fJ3k24sM_Ed_WsrrUY73ZHz3+ZJwa1S4pSqQshQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 1EbfZkhB79A517iuSyP_znR6RePnk7XQ
X-Proofpoint-GUID: 1EbfZkhB79A517iuSyP_znR6RePnk7XQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX/+dZbOXUknjW
 qaJNATH2Eapgu2brKO2VLPVLIJDM3IzKFosO6iU/nDSyyhlwHDCtTnIri4uCJGuapM17nYciHjI
 SEE7G+irkGGGXS28+8wKoENPCvgunqYiwvYPs7zwqn9SMGpwfDgqMkGyavyO55sWeDrTtfuTkE7
 hT+kyA4NTUFMrHG2chfqy775bpU4l252Cp+TvGAp/gWLK1ga25DCjJlxoi64teXu20EUdNOvamh
 yfvj1UapIWUiCjRyBE40lxvHGr7S2fWkp62gkdyRUd9eGUjoWAlQcLaOCzJnnxvwyT3ctP/PyAK
 8qXpHKxL05E5auYY0olnwpXsEssBvml/wJofHlYbaBz5qmsv3JhPWQ333ZzcVWzBHFvMea++krS
 AftQQqjNDK0Rd6wuPhXqsF9PvsMLgYIi2AvVtmyYfB4Pdf+WBkAINVnG4KhMz5r+qwPTS1oLY0Q
 BARciDOPDFaQ0VroYCA==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b00054e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=J237TlFOsQyoHL5R2bcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX/lXbABrLZW/h
 QPzgY/YS3dbFxgOHBrUPD+b3A8s0R8BqBOm9UnJCGopn2E+/UuCUD6N3NoClDKKSH5U0JiNih7k
 czRpJIG7H1lQTq+GdkzDurWF3g6duMk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200033

On Thu, Nov 19, 2026 at 4:04=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Glymur previously reused the X1E80100 CAMSS resources, where port@3
> selected CSIPHY4 through x1e80100 csiphy_res[3].csiphy.id.
>
> Add Glymur-specific CSIPHY resources so ports 0, 1 and 2 map to hardware
> PHY ids 0, 1 and 4. The remaining CAMSS resources continue to reuse the
> X1E80100 CAMSS resources.
>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 42 +++++++++++++++++++++++++=
+++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..f3cab9ecef04273e09b81ee0c=
d4e31ca45d1c915 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[=
] =3D {
>         },
>  };
>
> +static const struct camss_subdev_resources csiphy_res_glymur[] =3D {
> +       /* CSIPHY0 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 0,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +       /* CSIPHY1 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 1,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +       /* CSIPHY4 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 4,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +};
> +
>  static const struct camss_subdev_resources csiphy_res_x1e80100[] =3D {
>         /* CSIPHY0 */
>         {
> @@ -5572,6 +5596,22 @@ static void camss_remove(struct platform_device *p=
dev)
>         camss_genpd_cleanup(camss);
>  }
>
> +static const struct camss_resources glymur_resources =3D {
> +       .version =3D CAMSS_X1E80100,
> +       .pd_name =3D "top",
> +       .csiphy_res =3D csiphy_res_glymur,
> +       .tpg_res =3D tpg_res_x1e80100,
> +       .csid_res =3D csid_res_x1e80100,
> +       .vfe_res =3D vfe_res_x1e80100,
> +       .csid_wrapper_res =3D &csid_wrapper_res_x1e80100,
> +       .icc_res =3D icc_res_x1e80100,
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_x1e80100),
> +       .csiphy_num =3D ARRAY_SIZE(csiphy_res_glymur),
> +       .tpg_num =3D ARRAY_SIZE(tpg_res_x1e80100),
> +       .csid_num =3D ARRAY_SIZE(csid_res_x1e80100),
> +       .vfe_num =3D ARRAY_SIZE(vfe_res_x1e80100),
> +};
> +
>  static const struct camss_resources msm8916_resources =3D {
>         .version =3D CAMSS_8x16,
>         .csiphy_res =3D csiphy_res_8x16,
> @@ -5806,6 +5846,7 @@ static const struct camss_resources x1e80100_resour=
ces =3D {
>  };
>
>  static const struct of_device_id camss_dt_match[] =3D {
> +       { .compatible =3D "qcom,glymur-camss", .data =3D &glymur_resource=
s },
>         { .compatible =3D "qcom,msm8916-camss", .data =3D &msm8916_resour=
ces },
>         { .compatible =3D "qcom,msm8939-camss", .data =3D &msm8939_resour=
ces },
>         { .compatible =3D "qcom,msm8953-camss", .data =3D &msm8953_resour=
ces },
> @@ -5824,7 +5865,6 @@ static const struct of_device_id camss_dt_match[] =
=3D {
>         { .compatible =3D "qcom,sm8550-camss", .data =3D &sm8550_resource=
s },
>         { .compatible =3D "qcom,sm8650-camss", .data =3D &sm8650_resource=
s },
>         { .compatible =3D "qcom,x1e80100-camss", .data =3D &x1e80100_reso=
urces },
> -       { .compatible =3D "qcom,glymur-camss", .data =3D &x1e80100_resour=
ces },
>         { }
>  };
>
>
> --
> 2.34.1
>
