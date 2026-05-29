Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C433FDBFE
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065915; cv=pass; b=oxIUWPxOekuyq6avvrC2Si4latTtVOj5erY0vUVuuNvGktjXI1GDSh1yROD+TOXeFLtnNwcXLcrNZD53jCeZqmUEmQPQ5kiFsfAI9dTLB0IjhSL+9G/wOgEjYtO25FuD/g0P93pYq4Bvdj0CaWv3BV0hlHIys33y+qTvb4z4rwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065915; c=relaxed/simple;
	bh=qwqyWFzyrKSsAMxm847WHgVkmw/h391bpXABnCjyxKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VEhOKUrcKDB4wwYuSiFvkhu7ZFnM+qMnSn4PlsAH4QcQOXzHE5WmKo1lOdhPqEkzKmw3kM/1EQ/bQQz+0nf3PLfmFPf4sdL6btfPsdEXUDYaT9+2dho5vJAL9S+r5MOx90w/Sl6yB1n6aYMkOS0nDu2GlefSC/HtZcd+Uguo8w4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMH+hrEo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIoE68nq; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMH+hrEo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIoE68nq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDKxZ13568429
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jE9Zz9T7wgCExWwAR+zGHwf+mAaLpOUd64uRWuDMeyU=; b=WMH+hrEo35BWyQs+
	LqP0wu5Ho2MRbY4FKeDiMxhuTffs7RvhVFedC1bDwNopVqHKMvF8Ln/7EsEHCGgm
	dZvMOOCvfwXBrZbhwvzoqC0+zjYQjJRvSPEvjz88b9W7w4WmtAiglYdJNIxlhCiK
	kKI0xuJAObwnVjrcIpVdfBz7WWARcYyE7I/JooTQmKk2uxYQHWh7UXBoRME69xHi
	BnwRJrHCgvlejjRy7XkLi9ME8rGnQtNHHGjj8Rhveo+BMLYWe21JlooLI+0AP7fT
	LDr+MUDsllGR3MYdF0m56l8sHaQzeR0CmSokGOTbq7KK391TR1XbgMBj8UQsUW02
	y4nNoA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumv134-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:45:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514cbe73d00so357795321cf.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780065912; cv=none;
        d=google.com; s=arc-20240605;
        b=AggMosg8eZ0Eo/3vY5BmpCLtCB6CUJyTWBjSRJDa7QamM5yN90Ygw2r+v6ph+Tyht2
         cRBZpkGoaw4UQhRWH20BjLD2vmdFGHiA5nZ6ORU9dmKXSnrvMw4AMRi72fBP+bdFliBp
         0d5pBKqjRMt1Yymc8U2zOYgNmhXP2ZoW1gOzpSEJq6gOvIeRTyPCw1xaPLFgv4qJlewz
         zxSZWjm/oPrcoxGL72lVx1eS8YOiF3DKQav+dTAF5JKT4emQrsueP1hTGKf/wk6fU4jh
         IKXKhUwLznkbjggK2aesAsQO7L+JJdqIy7NDjRxzCLRYtBCDlCUkq6W68fo3QRWUG9ct
         dR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jE9Zz9T7wgCExWwAR+zGHwf+mAaLpOUd64uRWuDMeyU=;
        fh=scA46VY0IwqEQ8WSfY+FCnsaOft/IVik/ZzX7bvlcUs=;
        b=GlI0CxhIYQTXYj9Nl9XBqeg8VS1wXywzqqHMncjpynKzN+XsYafb7jn5kC7LXuuGKL
         5iV69Q+gGPeMy7wZYswrC5F9lAfSkLGHA0+/rwsqvtqpU0TynK4Fkn58QrL8GDIz8B0e
         U1s5JJ+yEtxI916lgSpGBAuKiOTmyPC03zzEsAM7iQbQHP77EbEAplUmwjCAcM7k+Ddc
         XZ/Bk8S2Db5hvi3zjW6OzUbyHp97YIVh3zLDs0cfJEhC4LIrAFhrnj2P0MInyPHR2oeo
         L7/b2BR7h8zdGQGMNBtY/2xEVCer/32bOqFbQieLilzeKV5BKaG25TT9vaUOTEiGNith
         apHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065912; x=1780670712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jE9Zz9T7wgCExWwAR+zGHwf+mAaLpOUd64uRWuDMeyU=;
        b=NIoE68nqwsorOsrMPvMccu+IxEpDAQLSpP6IzVg/7PSyPwtLq4U7q0Q4jIB9m6weHf
         WU8gd+KLvcn2LTieE0gEwj6CrQ2WdijQXblBGW2tEjQCSf4Yo8l4vCvg1dN6FdAXcVxi
         VqwXyXLZKOFvAyBQlgfVO5KEPhJTOHMk1KzzktS303IsFd8ixtHoz4eN+zf2jdxwrlVL
         yXhIdLR0/Pzo6RRrowBbzyerJZpM942Ir94RPEUCAPP4i44574yQiSRCjdVUtglvfmaI
         gwINrejYVWvuWeUqmT9jsxzxxSi3IwA+oGqQ5NqCXJspITncL2PrxtGM313hgT5NpgC5
         UCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065912; x=1780670712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jE9Zz9T7wgCExWwAR+zGHwf+mAaLpOUd64uRWuDMeyU=;
        b=tHlPgFsMN0Gkj2XAHGqDetKoRnnklTsHcyLzfmX7MbIbsp5YtbjrF2VgNGE2qdbWKK
         mqwJn7EkPwf7PCPD3+0pTmwL6O8YBuFFKsvTAq5hVibDzQXSXrm4A5JhTyjytoW36clI
         yFassCNOrLSfNRmNqBNEVKw8PNyi8EJZeAdE9ggIElZfLRRn3VXpp0b9cY+KjZ5t15Za
         uTdnjSZ2KLa249MZV1kYTZggq9NC0SGeRGweeT6XGOw1qlFe+LHWpSUPWGNNL2kOEbgy
         8Fk1jrX9FOtDvw/P2shFuyRoa6PCFyLerQK9QsB0neMWdAAvVjtuES3RubHOj2qmkPZi
         pVtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JY/mxRkBJE6aMfo/TFkqcbXIMi0enIzJvZwYN9zRserpxU0uAAd3F2KhttB08f8dN57yroIXP+QAP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqt7y7wVZwIjYBuGkMqgWSp5tRQAuDw3Qe2tt/atiInBMmMfMI
	jzama28S6pnRt06iaCXpTUsiULyY5owxk+yCticQ6D5mHxXO+D+yFXgv/mzYCsrhbpIv8geo8Dd
	Od3CtfEbr8zhNMtxpPtKmYP8mGFmT33CrzNbSiyo4PEzGSgxVJkIwEA2YpDQVhb5XQJRoT5WdHN
	TTaQChgBQ8H5g9rEGHtlI6INBnmWbjXlPJM5oJL3E=
X-Gm-Gg: Acq92OGDnmJqGo18c2/SvuAK+NH/qkcwNvk0lWTY92JcITdDRwuTHNz1CXpK8L4hHE3
	pzXtr88jl8Z8iMxsmtPeHOQwgXSX7b0a25Yk9ohWVo54my6YLHZXtv0b5BZNxiAHf40BmfUiu18
	pgLuBPSB4WjwdoUvVMSRCDTZr39SKSUzdrZ+Y0ZZUvr0dSCv5KER27JSgiZX4Gx6GTnieFNYyB8
	oaoXXHNTE+V6Qm1OA==
X-Received: by 2002:a05:620a:288f:b0:8f4:3895:25d3 with SMTP id af79cd13be357-9152fcd2f71mr442073285a.9.1780065911601;
        Fri, 29 May 2026 07:45:11 -0700 (PDT)
X-Received: by 2002:a05:620a:288f:b0:8f4:3895:25d3 with SMTP id
 af79cd13be357-9152fcd2f71mr442061785a.9.1780065911009; Fri, 29 May 2026
 07:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508101544.736317-1-monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260508101544.736317-1-monish.chunara@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 29 May 2026 16:45:00 +0200
X-Gm-Features: AVHnY4IkHBliNmi9XTq75zovqnSbNzkMdJ4usBjxx1RC2vXH9sWm-QJsbkmXUfw
Message-ID: <CAPx+jO9QyFWpqRC+W_aBnAedgnNGxyvAZnY+hkkymoSvwaavuQ@mail.gmail.com>
Subject: Re: [PATCH V2] dt-bindings: mmc: sdhci-msm: Document the Shikra compatible
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: UNnFltuqAQs8GL16DM9-ZbtUKgdHIYTn
X-Proofpoint-ORIG-GUID: UNnFltuqAQs8GL16DM9-ZbtUKgdHIYTn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NyBTYWx0ZWRfXzoiCnbIyj6wY
 w0ItHcXxCBOWb65RPS224E2HxUI+OfsJy2bvEyAbK97hhO6dkTsLnVa1C5mNxy8tNgvPm8jrGMM
 5j36opt55J4ca43gdeMKZb5wCUwtSdRHHSoV5UIco3fdzf71owq2Tz9DAPO3oQkhcjqn3KnOs1C
 HOj2GTZsBda/TBGUGZ4JKH2vcJlSgioLNnbUM1WT2h8nwoQF+WjNIlf5BQal34FWW9BHY+ALNOj
 ygbKZck3vLRQwwrDXO/RIFIhjPVdRc2rw/awZg4nF+PRT+w/kc41fodm5GmGlFZxENop+Hiups7
 zRN7MOVy/+qKtBZRYylLgiYBwVhseMC5BVTUTKovuW7kMusDcjXCTNO12dMO+7LEkXf+ExTMh34
 t+n+dXLQYsCQOB8XLHtng/Gryk1fFgaNNl2VtYWG5KVMxSMqi7HktckN0ovK09qDQHSmhuo3Ug5
 GHr7kCowJw9gmaMOp8Q==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a19a678 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=M5uxQS6IaA7ZX0B99K4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290147

On Fri, May 8, 2026 at 12:15=E2=80=AFPM Monish Chunara
<monish.chunara@oss.qualcomm.com> wrote:
>
> Document the Shikra-specific SDHCI compatible in the sdhci-msm binding.
> Use "qcom,sdhci-msm-v5" as the fallback compatible for the MSM SDHCI v5
> controller used on Shikra.
>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Docum=
entation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 695a95e8f35d..60dc6b0caa21 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -62,6 +62,7 @@ properties:
>                - qcom,sdx55-sdhci
>                - qcom,sdx65-sdhci
>                - qcom,sdx75-sdhci
> +              - qcom,shikra-sdhci
>                - qcom,sm6115-sdhci
>                - qcom,sm6125-sdhci
>                - qcom,sm6350-sdhci
> --
> 2.34.1
