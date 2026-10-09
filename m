Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EA637DEA1
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 19:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572829; cv=none; b=q+0bjKFNJ7LUxKfHqCfx6qNgdtMAnxsnqSmGLCS2KHOu67JXchuuGYJqn4s/3bngjRPbwDL/Yj116TQHGl5FQ9iVUHwLXbF/Nq+krTx5qyX1oRyQlioiPkqToQEgK1VpEKuvdjgGF5QJR1kw4fkjIlzjVdUdTDoEY2Et/V76tHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572829; c=relaxed/simple;
	bh=4DYl81kZlsuBgH9Cq6P3j2EEwAY76sVSxzqBLH4OTgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjK8nzJqiqR+nu/lcWg0zTlnMS6AlxF+tkoNHZIjXtiDee/2AHu/yZaogwrSQOhOW9GRNU943KNuKyUMJRjTKjkfPkHSjC9hyFHeK0JBIy7euJo5EpcGxgxiq0R0Op2xutbyePLIpHLtu0GZW2aaWJdMkrkqeeXgr3T/gbjwbKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrLeFETa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P6xc6MHd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WrLeFETa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P6xc6MHd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZVWP1016055
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 19:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rAx7zopvulLjm7Hc/dyluOi0
	kS3PVntTNHMshaG6O6s=; b=WrLeFETag5DPDLFdA6mGDsVLV0bkODfX9ZjQHCV7
	i5pQG2LdKOpRNtDIPKZw2YhA7jf6MA7vNU+R1zR6RRxa9QB63UfjEc46bevULuZ0
	wZdyg4FIigoEe49OqM1PvmQhBM+5MhgaQf0FldvscMNF7GWHLSKEsqmfbGNm7BhI
	l2I2gqVa3DpwuR0OrId4kBE6oZJ641x6L/lPm7ZmHTBYeSScZ7MFUv091w6f4K2J
	wXLO58J0kcPUxpvzmRM++Bdr10Uj1Xl2zPGJc/8NdeRk4DI8+HdK3lcrhHNEHGjt
	O6lKO5B/0rzZFjGlW1GV1RNNIz4gdnA1LEimt/KICpRUQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t88bvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 19:07:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso462343685a.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 12:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791572827; x=1792177627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rAx7zopvulLjm7Hc/dyluOi0kS3PVntTNHMshaG6O6s=;
        b=P6xc6MHd203qinrFvLBW4VO9qNbH9qGjRhUHNTnVo/XNgJGPY1x8ZD4PhJtpY9cFLJ
         BtxIYJcPArJLrYTE4ZvYO7lKfMLzoGt8BdGpt3vuqfv4dO4diWaMDwKejmuPkcnGl6zJ
         MEDc3tcRH/iJPrl5lBBbqGBzbsPTnqdawr0cjUG0ZENf2VkJ7S+VK8K2DqI+LaJwNUKj
         6ouT7nsrl2zAcG/zGK665v+gD85udWz7l7Zx0+Jc4TsvZuHoR+frSRkctQ3XHn4nHv7h
         eRofR9ANleE5yez46w+eOxDqwngIthKb0Br1w9nLTALdTrNsU/WHLvayVtLf5LzQlkB3
         ZXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791572827; x=1792177627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAx7zopvulLjm7Hc/dyluOi0kS3PVntTNHMshaG6O6s=;
        b=IJvqU01SIXmLEFzEeM/nIKcsAwRzZUgC6oBsCQGoEYB4MOXQbPyotnb6FEni2BEQda
         d1JA65HfDtxbS87p/IkHFob3MIbWXCQBPv44D7F4rqVNf1TP/XCXELpm8mv2ZnAU1waA
         1qbNAH/H9XclX1RLSj3pKMpbxNbDqmyksiRsJdqURhHyV0AZpns9OGdc1bXhpaDvt+bv
         BSU9IflzVd/lEnxV4HPMJKbRKMvuQbXJI/OjQQ8nnQ4m6nlSk+cEFiGRlJUBhZ2bHx9V
         F5gLDVYsaTE7ZDYPwDXclBpsKtIbJ0I0Hn/vAmC2dXs062IQSX/XiaZM9L8VGIO0O1y4
         erFQ==
X-Forwarded-Encrypted: i=1; AKwUvByET+SduxbNsoip9AWk0RNcJ7nTZONr7dYfk0R2w8v1GVD1FAtrWkDSr3uTZjfET1J8pK9d4BbBq5Bm@vger.kernel.org
X-Gm-Message-State: AFuF++l27R4sHtjrY6DMjFTjfXfwAbhqxKwEHIw104cuLU8eTHamX5qJ
	DSj9ieSzptsU3jpq2sBDInYAO70uggjIhoA1n/2Yi4jHchvJsSlr8Uy3mtGgKG+lFUsUej2Wv0D
	mS+gMEWB6rlFT63tdmEMO2VRug8ZGzPgM3LwdVt/xUw4N5OkDWRRiP0yESRDGf6sL
X-Gm-Gg: AYBFou03kc8VbUwguVGDasDWeDCug6yZhCL9Bd0ei3W0iYCref4VhsDa1+gWZr0rQA+
	QASKXgc/ZzJhD8wAiNVFrEcl4UOmKr8alRKF04IIfPLLexg5xQrPq5bMrDgJCJGHU4PCsxRhFvL
	NF1T5e+rRz1wygmK4haSBGWtDeOsrttqJCKB/USdiKuf9yWCt98UDaNwnVWACJSNfJ+o1TJgIUx
	ohSNDQVkjuV4w8vfdqJyHCi9fzQfmzBdX+egjMKySsBvk2ui3tJ7km0lk2cFJdtWlQdPH8b981G
	7eDQGlgg0So0RVpJqBKbf/RAAwxclpynJz0vFu7NLh7AsGk9xQku0QFy+gmglEtAYLrG3IjDzSn
	bK8zK0kx89pnqn6o=
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr523228485a.13.1791572826759;
        Fri, 09 Oct 2026 12:07:06 -0700 (PDT)
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr523220585a.13.1791572826018;
        Fri, 09 Oct 2026 12:07:06 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac94c6sm5327825f8f.42.2026.10.09.12.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:07:05 -0700 (PDT)
Date: Fri, 9 Oct 2026 22:07:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Message-ID: <vorbu5wtvnwxxd77lde7i53r72wu6wlta457ovvzso44rlgnnk@qa7egbe7mli3>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ZiFVGHRknmLlvoy0tva0oIXWzf1tqD3d
X-Proofpoint-GUID: ZiFVGHRknmLlvoy0tva0oIXWzf1tqD3d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX0Sw8Qm9tGdzF
 5VUP5bGIs9GAlmrxRN+poWu2Lahkhm+6SRnK08Lw5VnfNtu1wsJuAL8Sqdel/ACbuu1jkdKmcX7
 014VgPjQ9TjD29b/luGs25wdPEsWvf4=
X-Authority-Analysis: v=2.4 cv=JuNkP84C c=1 sm=1 tr=0 ts=6ac93b5b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX7scUfDhR9gSp
 qdpaPJjtIoczCICFIDPjd3ialucphfkhf7YxaohXFG4+evZjEL24PfnLXgFjGlLK27L+5trEJxP
 oWdj5Cvn2CxfT3opPotysFozMFLonxDi3MkvXfhyPhqQquuTbxtYic82YXJfrxk08wbhGsrLn+C
 ykt9P7uDEYjEDVQpUyiJINWvr229B4JtmfWNve5B91V/ZyKsjY5qvwZVDM7BQtDpavf7eOaar3D
 cxL2FT5W36ZJ1QLhhT9yHco8GJ5wjypNJ/0Kpq07WfndKoquAsUUiyhgLl/C9XBfMSTXP2ZWikI
 c/+b/GQNynsjTO9NINeWU6kTibskztBvFZnK71qqMmQVezGMACLagrE7uNoSmkW2EHBwUGs+gAb
 MkeJjpQXEX+TdIXawjKCcSVTAisE8BWfLb77tjtuyCY2OgwoQiGakJO+to2X5wcgh9jrayljBeH
 f6mqwjUKHyHZxgAydsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090076

On 26-10-08 16:10:35, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> SM8750: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node instead passes the board XO and GCC_VIDEO_AHB_CLK,
> which is not an input of the controller.
> 
> Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
> clock. No functional change, GCC_VIDEO_AHB_CLK is enabled independently
> of this node.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
