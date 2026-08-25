Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25D336B90F
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643062; cv=none; b=IV/+cfmwJkXUZfadiXXCoXS9b3/Kr+LLV1E+Nyvk8+tqlLGlCJM4ZGDeoIFT5P1GfrqweJ6vN2pVJpUn4qprGJ+HQ7Lf4n1UqeM2wvdU5c5k6p/TFSOwiufSYZhtmj+PvlBXEgrPqfB9EGrQZ626TGwv5aQbuoE3DdP2IC6fEGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643062; c=relaxed/simple;
	bh=DKDyunZ/NHZC1XfvKcnMDrgVZDuJLgBTTWj5TI1HtZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1DRX9gAiuD/UUHOajaVUBpcm7M4CMzaFnqqX5CkLirs8P+xoA3NSgF76+Rd3+LZ9SJCVIDrRU0578CSnojJVt4ZUE2paWqaz+eT+B5OHFo84uq9MRUSzy0evyz1k94xiLo1KBbLOc81CNzPui+1rRWZCtpJ/6eZMS5l7pKnLTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHx15qsR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTdgqF/X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHx15qsR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTdgqF/X"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P72C8j1228103
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3ZrdwNxsDTN3oeIFvijCZf6/
	bTMX0QBcaM7IHsPkBkY=; b=MHx15qsRfgO5CIhtUd43MtQE7Uokp2CNH7d6hCQB
	hzN5OqOu+LDq1NDju4m7GFVgP+PGRSqRLzJckZHU3bXvtSZi678+77Yh3aP3o1GQ
	B+rNkW7+IbVqwWl8d3UO0mT+ZnSNfk0P+vkjRKOKkC3m4nXUrYXlSccoEYcgnn04
	1SgCrA6KCBkAxfRG+VnlCq+iZwGhc615OfOcUIXDxo1B5PVbKn2EsRWoClns7Vrs
	bLtZHsVHNDqsRCmanfKpq5w9xGD5ySLwuYP6q4WM44LUDb30W30fPMSJF8GkztdZ
	qHakSmdKf0g4zLUbSpf0fGjgk9hbGAjA3qZzrd57gglIpg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g96abr3n9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:30:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-907c59bd73bso83776256d6.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 00:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787643059; x=1788247859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ZrdwNxsDTN3oeIFvijCZf6/bTMX0QBcaM7IHsPkBkY=;
        b=bTdgqF/XMxoNt9JRrv686D/xF688fXJWsv4FyVfE1aMolpj332Mw5CuUUlMcBdOv5e
         kErG2924Chil+L1rCbhl+t2/uhW829bU9YfvrrcmyUxK+ydSi1GHwQ9qTrdc29EmYJaM
         qthDlwwTejWX76aY7B+KiYpnnXKZag84GEJ697a5sHN/IddsPzQ9LNgQFweUAoPLPCd8
         0kzNsCEDXXnqeMA+l7sEzZPsDdVnqdV3bjwHKl12oIE92Kh1aAtN+zsNLH+cazWwuH0w
         S5XnL2XFjRjAYL1Jeo+n57DsMuxDQAZVPXQufcwis6ithr4dIFX9NKXX1tohEuceCdTr
         QdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787643059; x=1788247859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ZrdwNxsDTN3oeIFvijCZf6/bTMX0QBcaM7IHsPkBkY=;
        b=pb8F70sfrVO3FJVMB04uQbw+0nbrBhXpx/0+2MAtUlqsCaWJhkmq82XFIwcFdaHlu3
         uYHkc6mNX7ocVZuI+dfsG/j4TCMkv8WEmNCVLrZ8IVO3ZHFDt3fI2+2CCznbni49OqYi
         xobP45X4kirV7MvhgyYzqi0b9++xlZDjzdJWzeYCJEE6nJVRnnSYx/uZXfAcpb44JPc1
         BY4jIiSj7C9doQ0f9vBja1Y7P/QDTTCe7ihqcWc+0awshXaVtL4cuv9wMjUr2gSab/yY
         4572g5Zyt/X5g0xZ9Q7joFToUF0c3qRbfu43gN3F6c3xozf6Ca9OsHIVu+Z29C6JImk3
         q+cg==
X-Forwarded-Encrypted: i=1; AHgh+Rqv98C5WGKl6rcco8g6z8aosRVLcDdcdmv/USENsfWY7nuP7QqrKeAHTqPjBCGEj5uxvnv3HmQKR54B@vger.kernel.org
X-Gm-Message-State: AFuF++kio0V87nS1zyCSDBNMHJxuVQXznwlJ1WH7FpoX1JPf4HGlZoog
	6cjsXejbCZG0EXLTFqzT7EKS+b5MQQtN8hfAqCgCKy6u6Qd/Y/NfXtjQsJZYc/DQI7fD7XoXhKe
	rq+8IZZSu2zEHch4fRYVfynX9vY7V7VYZISL3oFqatsnHd9YMCKohlSAbszNkgG8A
X-Gm-Gg: AR+sD12VlqyjZh2PFn9qk3mq5bH3VRRgRgF2e0oj9uLlqA9Z3d8tLBOqVyKLHPu6I2l
	q/3Dk97QIWbJLiPV/E5C7ixSMmG6U7wf4WAu/rFh15x4ng32GYHKc85FDDRrPQyDxwYBAr1S3kr
	ogbK/V02D/ljT4L8lEPouBScsy9wr79j4iFd2bObu76Au4iKWmA1bwYs6Hc+ZrKlXWGORopv/2o
	GdYoSkaKstpWJOdumWwAiFN6XDPXRz5w9cdj2UXUsPfS3JkILdGtGZZyPaIkufyQRYQ5dpMTfls
	i+Wc5hSqRVkwukQUTkTMETk/aQggpeBpsx4o/SO7vC9YUSPM0iI329MSSVYxXqgVpm4LtF+YJjM
	o55jJzo9S5/aKGg==
X-Received: by 2002:a05:622a:c85:b0:52e:1364:debd with SMTP id d75a77b69052e-52e2f14fbdemr53017851cf.33.1787643058705;
        Tue, 25 Aug 2026 00:30:58 -0700 (PDT)
X-Received: by 2002:a05:622a:c85:b0:52e:1364:debd with SMTP id d75a77b69052e-52e2f14fbdemr53017231cf.33.1787643058094;
        Tue, 25 Aug 2026 00:30:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24967383e5sm1583156566b.45.2026.08.25.00.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 00:30:56 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:30:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/47] dt-bindings: clock: qcom: gcc-sdm845: Add CX
 power domain
Message-ID: <qcvnb5nifvwtocgrlc5nddkwgakqjdrqj7uazplj5jpy7jmasu@o555nrglms2j>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-1-f1205a92682b@oss.qualcomm.com>
 <6d8b7fc0-9bd5-4bfa-97b0-a20bf01779c5@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d8b7fc0-9bd5-4bfa-97b0-a20bf01779c5@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2MiBTYWx0ZWRfX/MHLOyg5UOBu
 kjCgpx5Me9cGLrlxH4bav76jihrtwHaFzAi1/w+e+tILz/HtKssZO9n0gvKn+xINjXEhJk4gOpp
 PvSfAXkitPKhaauYpi36QwbPbjr7OCgKw7C03S4Oef+/Y6Zbb6EHyHQWLd/8Etpbf0okhkBo7VS
 pHCA2Let5flR8OfwEJk1OFCuEUGQC4P2zHnYYbcrDOtXxw8XjItjJtajaStNHBXKu68QVYrfmge
 10yQkw+IO+opRmuqvg4S7qLYdx9GEZ9tafLrWTJiOLH3RTOM35aJ67cANDKcMmwH2mTHvuyzLjz
 y33Vg1D77CdzbyWebHOL9K30GebUiU2igxGVA6ieoOska8A/udA28MiNigpeJR2xQ519JPIvS/S
 eItBGzKoyqslIU0HV7pkHjPlvc1SFOv49yP1iojT+qqpcPLfk9DfoK+wwaWPIpbAWJ7Cv4+0HfN
 gugTSTwpnytXjVr9uvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2MiBTYWx0ZWRfXyLFQniN/4Ujn
 a/gUMtWc/RJ5MBOF6g575hbGWdcCYf9juN/6wbc8qo61nDA/xWfFj9o0WoIJ6VogZpsKK7xnWUO
 P2wloUOePgJikujpkwHFpRWzZMbgPE0=
X-Proofpoint-GUID: 5iXyNdr-QKliN0l8nY_jBrovL2XxhZLw
X-Proofpoint-ORIG-GUID: 5iXyNdr-QKliN0l8nY_jBrovL2XxhZLw
X-Authority-Analysis: v=2.4 cv=SaHHsPRu c=1 sm=1 tr=0 ts=6a8d44b3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=i6VLWpIXabWwsCG0LkoA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250062

On 26-08-24 22:39:28, Krzysztof Kozlowski wrote:
> On 24/08/2026 13:53, Abel Vesa wrote:
> > Describe the CX power-domain dependency for SDM845 and SDM670 GCCs, and
> > require it for both compatibles.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> > index a7523a414341..980edcd244a2 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> > @@ -31,6 +31,8 @@ properties:
> >      maxItems: 5
> >  
> >    power-domains:
> > +    description:
> > +      A phandle and PM domain specifier for the CX power domain.
> 
> Describe items instead:
> items:
>   - description:
> 
> Also, "A phandle and PM domain specifier for the" is redundant part of
> sentence. This cannot be anything else than phandle and PM domain, thus
> just say "CX power domain".

Will fix.

> 
> >      maxItems: 1
> >  
> >  required:
> > @@ -56,6 +58,8 @@ allOf:
> >              - const: bi_tcxo
> >              - const: bi_tcxo_ao
> >              - const: sleep_clk
> > +      required:
> > +        - power-domains
> 
> Why? Commit msg should tell me why you are changing ABI. It is actual
> ABI break without an explanation...

Actually, I should've kept the same commit message as for the other
bindings.

Thanks for reviewing.

Abel
