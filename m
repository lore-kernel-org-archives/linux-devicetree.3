Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB244137AE
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908249; cv=none; b=Ef6df9J+hNx1KcBhzpvm4rp4Tysh5iiSvT1oIzW/Oyp1h82lKgGuLDT0d6RALUAypnDl0VCa7iXRjSTLrmdakU/rHbdPCV2hg1eIgjOmWWGmnJ+uetNgF9ACy0Dg4EjpsdGLpVq0hHMmRqmKkHlDRMedWDFMrRi0hcycLIXuN9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908249; c=relaxed/simple;
	bh=H1wc9vGVsGCeG48/JExdFPP0oJJqqWCSm2PIC2HdVTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ltd7WLoQZQlOQqGsTdEhwE+3aUx8gTNnooscMUiMF2iK9rio/Zk9vaOzKzX4n0GjdYo0ZwKzfMIls7P0kvtD2UQijZPapRcAvlYRdBq/TILohiB8Jy4IsptOcTgxaDBSA434PKuwJaTNn389z4DLkSlxgsyfFYrtYhmqUE9ndK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hC6EVB1Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfqyWIuX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hC6EVB1Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfqyWIuX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODb5JG2933428
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AsLrz+AUtIAsWpyhnYd38/0R5o2hWRM61PfRwNfUs84=; b=hC6EVB1YB052qg1j
	JzfLHBn+EON/IJbaqOMREWXDflpiA2k+S3WSfUrz99Ej1ceiZ7pf0zpdJ1nrLHPt
	SqsXNwxX+2UpKDK0FagHmQFG1CWRNbfKXMwm+MIPwQ5dhQZ8/OhSzehG3fDFUBUD
	UKly15G9psdj8ykoAHbHzr+hJn/FecvmnVbiQFzXJ3KqaptvwQoBZx3opBf2LITv
	CZzqf+z/9F8Z5Zk3llr6EKyzY4YUG2VZoFqJEc7BzEdCMdJAtTDZNTvezmrhwu8c
	dtnGDa7bGER6+1p6OFcpf/GtxNfpiHlKOPOAn8HLovSzx45N+gVcTNZlnAR1zf+i
	3Syxlg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cj8ndm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:50:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1e777a15so360311cf.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784908246; x=1785513046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsLrz+AUtIAsWpyhnYd38/0R5o2hWRM61PfRwNfUs84=;
        b=hfqyWIuXpPDxgbW/Zn/67IoJER9dvXKvbpL1l9uL7FBtheVauAwk8HP0qMH6EOu2ZM
         K4N2ePkJo/u3efxesczbAJpL9OvKuUIj26ry4j1A5J3jEx6gphR82m+E5DlSwxSD+C4V
         rj4jwRWkhUs/EfeQvH8p5PWXG6pItCOLwN+l8TKquF1RJ3EtcxO+LcKq2yWCIoRUuE9b
         TarNkhVEvOW8GwGNaY7pEnKo61sB4n+8/eFhmjNiprWfLQcot9n7XdtKmn4zRsKYQ7ii
         mpc4lYBjxwkkxE/WRkJhoVghVpfUigxEkS2hOPdx/9vDFizp339mHe0+jDZ4cw8IOwU5
         RUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908246; x=1785513046;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsLrz+AUtIAsWpyhnYd38/0R5o2hWRM61PfRwNfUs84=;
        b=bXQ/S2BRdIk/Rg9fr+YF7f/aTSBVyurnm5FCwZ0i/FUap+PrQ9bmHwphUQiK8HuiRP
         AoEtRs8QCjcKx9w6EKaK9h+YFWcAqYQSURb+Krcgv0jgZ+YQ0GN3gdslx0YYHjpvm3Sr
         YuggMLqlZlKCPnDC3lbecDA4GFlm1sXkobjYQpI1KiYb0+eGlWDXvS3SB97t/ezevfsW
         6oUyGK51ftrjf55Rkwn4iAYAFNpMEEJ+AtGVsX+6vQQOs0/USrCi8B1KwJVloee95+gd
         ztY69qjk2mZ1W7NncHOv66UFEI/FXvSkltrmBSroeUlFfOJL2E+HvKB5PdszpJvxd40T
         TATA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/DEceAGAdXINiS8hD0qYwqGlcUTnUQfQHXy6TH36GPJPpBBNYEaK99+YNHiYR4LdiFoJziKD9BB1b@vger.kernel.org
X-Gm-Message-State: AOJu0YyxQpVLz2yNAQtl68FdecuyI/nZXqttCWuw5/4hbBc3hnYER2Vr
	7+0IjFhv6nW9B6w5y7pn6XZlIzoxib7lnYdCC94jU+sXTR6BCdtHsaiwFQrcazAIE8n69ukl2G3
	ogTK0FA0EhI4hb77TgXPLG0icQhY0oApdpNHAVmWX3o3MzZ5xkA34Sel18XzZcI/I
X-Gm-Gg: AR+sD10cs9/vs5EHdemcmf6zvROsEvvEPuz3XKkJ1JPqeb33So57xMUs3EN6gDfQOvm
	5GysVlSKH2vfqQPbpCKviHaBwK0/NqK02VEbFTXTwhHKNAJq5nw+xOgHHHyZjQVMClFDapHmZLf
	twfhqVbQtCxjwMtkwlKfMhjyvMMoJ4BEcuK6vkVpc9M5goGq+pQoyUhgghev36UZOLOrnCb5n7u
	vMaUuGBIHlfLL/DK5IfL3+hJbnTqH5UK58BV8bgXK6kDdflLojTCbTTUWp3SmjaA60qCtWuWPud
	f7vK+TCQRm7nl9kUwQvkJ6aYApYBp61RuSRrLTgRfw1Ru8r76QqyrGHr9YCuWHey4lV7UhQXH5p
	5tq1Ia6RaqsNpMhk47Sm/etWP
X-Received: by 2002:ac8:614b:0:10b0:51c:857f:9c1c with SMTP id d75a77b69052e-5283dff23f2mr45688451cf.11.1784908245642;
        Fri, 24 Jul 2026 08:50:45 -0700 (PDT)
X-Received: by 2002:ac8:614b:0:10b0:51c:857f:9c1c with SMTP id d75a77b69052e-5283dff23f2mr45688121cf.11.1784908245047;
        Fri, 24 Jul 2026 08:50:45 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1f8fb1sm7929e87.72.2026.07.24.08.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 08:50:44 -0700 (PDT)
Message-ID: <bc845149-2a19-430f-9768-3443b10c0c65@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:50:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] clk: qcom: ipq-cmn-pll: Use
 devm_clk_hw_register_fixed_rate_parent_data
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-1-a8b8679d215f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-1-a8b8679d215f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GJE41ONK c=1 sm=1 tr=0 ts=6a6389d6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=C_jcV2f4aFh2m0BU-kAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0MiBTYWx0ZWRfX/Kv+bSgIJ9ya
 OuLWto9EZlCKwMMH1KpLanRguMVs1I954mIMeqxs9O368o1S1uYJmFxr+39+VRD6kb2IBXpSaty
 SzuAlXx5QL6YygTUV2kqOF2l4kc3h6IcIl9//H2lCta9W76f2E+lFboVEu4PP9XVPt4JK56Z8pf
 TUGA2p29c+QEw8YbM4EsZc+4CVX3BSllXIysEsUuj4vq9wEOcsdOimkhO9wlkbdGbH6uic1RNxe
 rzpTte0KxL+BcY8e2AP2g+FCKQRihr0dYwG8VdighpAVf3H0e1XYQM3QbJe7AJjtErtlO6eRitr
 wdf8fMg3OPW+Z0aTUWpSGW/FxEt8zRcMsgB2yx78OAojT1/nFWMtRPtL6q6/Zc2Vd1R6U0skim4
 qSva69GeNsuYj6mBF13Tr29lVJf7XmmgcF56EUoHO9j29YaFna3dhHiiePu84CnhuvFH6T4lIul
 RCvYLt9ehwAHN38A2nA==
X-Proofpoint-ORIG-GUID: WlzMtyYFp_jsN7Q9O3VvdZJxLnSv8ONM
X-Proofpoint-GUID: WlzMtyYFp_jsN7Q9O3VvdZJxLnSv8ONM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0MiBTYWx0ZWRfXxD+WRXbn/tOV
 8s+eUbP8uWoOGh/vpFGmM6F8ELN5jPOIT6MmtZNX00aapWpvh7qt+oMfGDYncXxotPFvDpkkUO0
 /lRrQKukbPnnLy/8+GqXrHk83kCxtfo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240142

On 7/24/26 5:00 PM, Luo Jie wrote:
> Replace clk_hw_register_fixed_rate_parent_hw() with the managed
> devm_clk_hw_register_fixed_rate_parent_data() so the fixed-rate output
> clocks are automatically unregistered when the device is unbound.
> 
> Since all clocks in the driver are now registered via devm_ variants,
> the remove callback 'ipq_cmn_pll_clk_remove()' and the manual
> 'unregister_fixed_clk' error-path loop are no longer needed and are
> removed.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
