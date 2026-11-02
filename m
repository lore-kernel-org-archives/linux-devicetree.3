Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634860;
	b=ELubMDgsXTfmpFycV4Fu5aMaPO5aveOQyFwuud4TWF2pcTXafeiPwwNRd5GUndiEOVyc
	 UiU1YNssyS3j5JCnhaFutpVaPPyhJtcjv+wmqTnYpKvMqOWvDFxGPskPyCRhVAhuHreS2
	 aevz00D6LsFmQmp9CYFMbmxGEJ/Bm44YbKq+nfbHNHs09WqnMvXZo8vJgXP1a52aQrvI8
	 YdglJIkQOsljnQfL4Gsa/cbwsSQJV5+8p99xHZHdRnrRNUG/VxGbkVbxFM8OhHZPiawBu
	 CZkxq0KJZddszh9DWN6YAyDryg+SCGC8RKRGw3UUQCitZSJe+pO3LQQrPDnc3Y3vZng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1LE/KEw9I1BDmogKb7eT/az3rbDg025MtnoB+zoMeP4=;
	b=F3nckoraOm5RTVNYSz72INV0+EPfkaYOYWr79J/V5vKrHYgIfkyiEvNJx4Z4yr6IWLYx
	 iP6wjW0GrEUEPd0Y6FPCdPGUYe78bnoj8r4bBk1q1ck36RpuLvfoIUj7hgJis1nif0FT9
	 AMlexcNbINaW5FMmSxK7kinhAyNy/92tMf5kevVaY1eEuHx09cBLbxDdHIG00mu8F8xmF
	 tEhd7mZMZ7CQ37DpbufPTWzw8dhIIhYbzS+7piCQpvS5YHBvjidajXudda4nVLqWnsikV
	 V+XGWQBwe0sWaz/uWHyJ0A5h78WM6QoCPbVZZREeo9P8tcKLWGmLUpS68XhcbEPQ1MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bj00Z0tQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDZDcA0f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DC5606A58E
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4DC5606A58E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bj00Z0tQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDZDcA0f
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpZxF4034202
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 15:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1LE/KEw9I1BDmogKb7eT/az3
	rbDg025MtnoB+zoMeP4=; b=Bj00Z0tQaL+NK0Hf9+NmhfjhpVFgfhvRmAeWxiMU
	LraM7SvRkhm/v0A7t0OZYAEikg7tytCRLBi9qfcl2Y6aQK7DieMLqO7wDAjAEj/t
	QN8Tqb5k1cpsq6kxUmkrOcumW52s0BTUE1HPGjKvCk9RzBPPlpwQZpEhRGp51DWU
	EKIXRIr0cJt+GykENZS/twIEXK6O2z0+/jFNKDIsE3JvOC9r4kMqnTk7DRAWbtZf
	YGuaKBU4LjIkbvasQtfleRzBWuIPQOB2clx2AaGcwYJz19u8NqqTWB+X0xWYUFXg
	Q3TNAn228TqkFxQsfbKoc0p1eJEqWTQxkbNOg/eTh3IS/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe9ygd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 15:54:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so608433085a.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634858; x=1794239658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1LE/KEw9I1BDmogKb7eT/az3rbDg025MtnoB+zoMeP4=;
        b=UDZDcA0fC4h0JVD4gIXc3kYgD9PN5uvI2lJkTt4N+8iZMw/xvSZ/xLdzImAg9WiG7l
         SMDIvaqSU/fj73GPj/EQajt8cLCf+3YDIRxF/DM+d1ls9a11JUVxbg2HcC+LBr6z59V/
         79Lm1Znon/dGN10NZUrc06xHlpo3Ezk0BTxum3ren/RKWVzQxnbIDlXEllEJJZJdidz0
         exQ8QHoH3bULzYl9wxVTz4GLmiwTeTf/tE8d/qHUUl1uqNsnfloRoKxxzcc9iKpkfzBf
         AB/1S0W/GFYbYPTHPz0XA6C5FBYUH3eDxdiRzrf5HcrUaMDazzyTU2xWuludlfDGI2Kv
         Wimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634858; x=1794239658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LE/KEw9I1BDmogKb7eT/az3rbDg025MtnoB+zoMeP4=;
        b=hK67kYygGSjNqzh+H19qwMoX2AvI8LLOUkSUjgkdBmc3QExCMCTVs1PnTL7E8UHNXw
         uuKtMtc7TduEzHPIYPQtQiOz+Hp45gO0pFa2IhISUebT4/cDMy/0P77dlQsziRHAop5l
         SbjGgZcN5BT8tO6Sc7VBRZkfg6p02UqRdyFfKYVwFRvpQKtQ2xhSjl5vVfLP+8YVbVf3
         NHUMOVn7RMmagRe/zJfWBN2Sy3MlTDCcHGLBXj72m4hHm2qy/fh74bZuBVz5nACzvNmQ
         uaTVYg0K74MT4tIcwDzKbrlLO9wiuRLjhzqltXUmKUV8COmQ2JFwxhv1j8nqrFBp+p8t
         zXAw==
X-Forwarded-Encrypted: i=1; AKwUvBxHf5U/ZhIPAWeZ+lJUNJgTMiM/GVW8jM1reUD62PKwkFCA2qy1qzT2JV/n0AmWLRETDSGM4eDhgu8l@vger.kernel.org
X-Gm-Message-State: AFq9FYJzfu9z9H4QgSxgi2XgXnI/lrzqHCiCvDbHAaADhMlOs0IQ0SlU
	bGK8hIqjTgqGCSfy9dr66hSeJPNPO8galYvPwDT424ZWe2rlmF+xAzeElre04LgQkofRyqW5a2R
	Q7ktcPqVd81xZMCy52m/Hxyk0HJHYbG+aVwx+3zFrilW9k5nmj+zG6ErhVbo9gmVZ
X-Gm-Gg: AYBFou2tDHYOkafqGp3R6FWe+Jeu3SyJA2nrmtab4PMAxYTGmoLOG1m37QavhFcnKHZ
	D2yFxQGeVkn88D3/hnyGlj9yhb3zdf0AbZr/u3CKwAzvjVU5lPlGnKZ2AiMJM05/XpVvPd5dPKR
	dj00uBUGlttFpEe1qaU/sJwQUe/UA83LXYCkBGLbxj9F1k4hwVYF6PiIgmSb5ZUeOGUBnjrgnkJ
	ztBUm7Y8eRdpS0OXhGbeVce9w+GXP9o4SLdnLsNUPRtSmp9FC5TFBQNGc14JrjE0Q3QDD22gOsG
	P9WjVcbo88OKt0HNcTT2qlGJoxbp2DSbQZsV85P95jemPjBKL0OdSJZDRxQ1G3i8IkvEu3oh0cm
	as259zkqwz/M3BgzZYji5Rtu5HURDGYz2/OU38tBmAmfKBJK4BGgZumqQ9IiYmlIkcfnb74+X0X
	y9KvLVIguY3Co3G3VTLw3vy2dKCx9JkFqKeAENsZ60UHh83YT3KM9jpB+Gj+Yn
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id af79cd13be357-9441338b4cfmr2083216585a.23.1793634857876;
        Mon, 02 Nov 2026 07:54:17 -0800 (PST)
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id af79cd13be357-9441338b4cfmr2083212685a.23.1793634857433;
        Mon, 02 Nov 2026 07:54:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acd5c50f25sm173191fa.38.2026.11.02.07.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:54:16 -0800 (PST)
Date: Mon, 2 Nov 2026 17:54:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
Message-ID: <5ekc5ibn66mc7gubh2n7htv3u64zomvfopsjnddanzayenxnpv@nczbef2enjfr>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8b22b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=wGsgk0abFfW9C8vl4LYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX8XWLeor3CX3u
 QIpwEFU5acG7vZK/HyV5oN6qFigbNcKbea9LIkZ1eUDV2Ndjq81YFxDpXwsF0Fw1rKcLAzOFkZm
 eFB1zqK7tMWVKJ4D0nnVC+kuYnnXmuWwaAfGj3l437hq/+pe7LVzoeLPQ4Dl/IwvCYQS6bSTu1r
 6T0+OHcRp2lJWB4TXMJjy6eCL8kETyEs3cgwr3K1Xcaw5UYlJJdS4GPaL7b+GpSdD8/Hg6RUHUD
 IGi25LFd5zRdcmMQoUYk+4V+Np7k3TCIsUorz2TUNqvGHPrrpXCxRjPKexmn2uV3beHRUT6aoTt
 hFk76i8ttEwnOTq4Lw4jtTxmVZjHZD3B6EV85X4uvDe2kvGzPHkIeld+WpgmtfiSyj1g4/szowU
 vin3hIajig3FON2m2TcbLVJesdn8mnfsn6GL4ExlAcWiJsWk2aUEIFO534H55fRw6hWtYs0AA5X
 mkKK8dqBQqMcbp1BPEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX7/9O4iI2K9Jm
 hqneXVqQ1epnaKuUQj9T7cRqmVZqoZevq/e9l9mRuFaVQE91a5mOPN2/Kcr++a32B31yw4CpVam
 9JAy6WOMHOTaJMpehWJ/ns/YtzzL+TE=
X-Proofpoint-ORIG-GUID: Bg-OsB_EnhxGWkSYmPtq0gsPPqPH5Afr
X-Proofpoint-GUID: Bg-OsB_EnhxGWkSYmPtq0gsPPqPH5Afr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

On Mon, Oct 26, 2026 at 04:59:27PM +0530, Taniya Das wrote:
> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
> clock divider. The hardware generates a fractional output frequency
> from a fixed input clock (typically TCXO4) using the relation
> Fout = Fin * (M / N), with duty cycle controlled by a separate D
> register. The clock output is routed over a gpio controlled pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,clk-gp-mnd.yaml | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8141f392c5d70acfc42cf1ff4b1722e1eff23afa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,clk-gp-mnd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Peripheral Web's PDM GP_MN Clock Divider
> +
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |
> +  The Peripheral Web's PDM GP_MN clock divider receives an input clock
> +  (TCXO4) with frequency Fin and generates an output clock with
> +  frequency Fout = Fin * (M / N) and a duty cycle controlled by D
> +  and routed over a gpio pin.
> +
> +  The divider is configured using three registers:
> +
> +  - GP_MN_CLK_MDIV: holds the M value.
> +  - GP_MN_CLK_NDIV: holds the ones complement of (N - M).
> +  - GP_MN_CLK_DUTY: holds the D value.
> +
> +  For every N input clock cycles the GP_MN produces M output clock
> +  cycles. D is the number of native clock cycles in which the GP_MN
> +  output is low, counted over 2^13 native clock cycles.
> +
> +  Hardware constraints:
> +
> +    M <= 511
> +    N <= 8191
> +    N > 2 * M
> +    M < D < (N - M)
> +    M and N must be coprime (no common divisor)
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,sc7280-gp-mnd

What was the first chip where these registers appeared? Was it present
on SDM845?

> +      - items:
> +          - enum:
> +              - qcom,sa8775p-gp-mnd
> +              - qcom,qcs8300-gp-mnd
> +              - qcom,qcs615-gp-mnd
> +          - const: qcom,sc7280-gp-mnd
> +
> +  reg:
> +    maxItems: 1
> +
> 

-- 
With best wishes
Dmitry
