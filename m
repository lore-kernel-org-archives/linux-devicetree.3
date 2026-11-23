Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447408;
	b=F0709Ql0s/IgA1a7i36xNxF2aY3nQWUjmf4HWZHt6PQgQgKrhmU3z019+GWeJLu67jmX
	 iyvlyU1zismfAHuCip9xtv9uaX5jSboLUIeleaQUcdt2oqZAZbd7JEPHBXO3ag9Z+LkrW
	 YWpbh6jQkveA/RE5BOJsnfhTG/bNFk9IJte2LpadamvyjyqD8rUfuLsHZ+nFUQpjL64JR
	 qw29jSLYwi+O/81xbeMDOPxD4EZZ3SN2FoWtkyQtlwE11NVMNu+GM8N2FBKuGo8GUP87t
	 DbEzEd1PUp/jC0t8aPpAoujnyJNowY7RW0+ZAHRIKwxt57+w+mKWn8mWnbJQAm22VOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447408;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hlb6BJq9p61fYoar56ASHEQgHyDDnHMDuFb4MoZS8Cw=;
	b=LyBwNlwbtyMDKYQ0vdNOwEubpogWySpdG6gaUK++s5gVu6X3X0GUXFXRR2D7HDZKPgnN
	 ZzIa2eeW51TipTD9Q1RLpNdFFUrn+XLu/TpSEi9nIpXqFhy9wUPhrlSJ+n4VZMm1H073/
	 6wc2JJHinRbiE/L3jFBI0A7JaTMhnR0Ep6/O89aeEYIiOQ9Blq3IzXsT6Ts5MZDiRX1kW
	 AbZhHmDgeIU8ow2/pkPmac9YMopjMsW0oO7w2EZhiy9jIbkHfcz0+NrE6xCo0KteRD1bL
	 DbXmmqEMBdpJ486KwfJsC5Jx3JS3opqPDUdwqHWhX3kZEMNWFDqBE7wH6ab7DvlSQig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RqsFUyhC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=duv8Yq3W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566E4606A32D
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 566E4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RqsFUyhC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=duv8Yq3W
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL4P13072614
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hlb6BJq9p61fYoar56ASHEQgHyDDnHMDuFb4MoZS8Cw=; b=RqsFUyhCmepWWsF/
	rr280aDKH8Udvemg/SSbsq46+Fl38Lr5q8W/RJfdI82TM0AvpGnhAhCOvXHxJ5gV
	ZWfcZS1BYbQCSc9EtWGfw+zcgQL6q/sW4IxJVvBHEOGv3ISBggRgbQWys24T+eh8
	57YYXbJEDWSqU/Uo5q/XEsOJuP1++7UBc+wsX9uX2FTX+pTqS+vICcJiphPvS+A0
	E6fjdqh+7UAFny+VyWZCL6Ozik+9HYUwqkLb23pkos+54xiJwdRKy0suXfn8PbC4
	0aLJ1FXhBwzRwXUqZ6GMLlFxKAKpO5j136LPCR5do5Ld+YyIQX3g7yy7g4fAZ3v5
	ObYn3g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7sp2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:23:27 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso91966e0c.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447407; x=1796052207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlb6BJq9p61fYoar56ASHEQgHyDDnHMDuFb4MoZS8Cw=;
        b=duv8Yq3WHOwtSw5q/h4hZMBt5EwZ2n8+zGyqGuSMTfx9YgSXrYj2db/UODqBjApBNb
         jSP0RhBVhOPw8uVrOg8Jj18mX/4u2Ebaf2UBs09m5jx3ksuN2tfcnaLJENJ+XhqW2/q+
         7Krz1BoDX+iabw3erk+cPtI01PZVJU3WjrHskIxUe8DXlWlvegrobAb1pYgC9L3OS4hE
         9UbtqKcdnvpGjIjoYZsr4B30IVMye7/IIYrxtux1ywTd+WIjJHcljdVmv6UCP+mAkeWU
         oRuVO4bJLFfOMpBDzSR0qLfSuM9Es5kBAkJKStLdQ9Cqb/YWBx/5cEaSc997oTPyFv6K
         QiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447407; x=1796052207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hlb6BJq9p61fYoar56ASHEQgHyDDnHMDuFb4MoZS8Cw=;
        b=t+aQOk//pUXM5oR1iCRL/6iWN0jGT1WT5rZyVqMPYS1W55ieykyf7f2YCACfoRcTki
         WcAbSL6YVL0+kYfPafkY5qLbEAQBoXiN+TfIWbexFJ4lfgsViWnzJ6iavnLQbS9G+6g5
         ftmS6+LwzXYDJWzLWMec/30uB0MxyATB+RGYwz3qcVYjZN9/Kkf+/EGxli6nMyYK9wx3
         c+7tOXECVeK+mmiHSE1EvtFyE9XYGUdT1BoSa+HGvo+ajAUM2D4KHRmq48FrsiWmmf0a
         F3pSm6q3DyynaqlrplK/Ofr+UGiMO8Zjz3YvqeIo1vWmRL0UUytKeqkaduDSJBwLdUlD
         ULpg==
X-Forwarded-Encrypted: i=1; AL+hErG1uKXllxMMz56uyINAGvOajOAjxVTWMSPs9tXxEecq0hkSN6P4vg05Hb7HnLhCA6jqaYfJhiyaF4Y1@vger.kernel.org
X-Gm-Message-State: APuU4Z+S2Gbha7qHa9j6kUxMF/JrmOuoeX1B0zoH76tdpAYX20BPb0Lb
	0g8UBie1F09FEUchtzk8Gx0A58rXF+KVQAw+EopwSDGyiB4TQZzCvNJoQI1hgHmkjsSoNExrlK1
	aTP1MaPedC7za43e3JGbApyMdS5jsqCAzF7IgyE92KM4ukqNwcZKD1gPuqvoMsdwr
X-Gm-Gg: AZFdTZeVMvRddirPqj1ovVzRGsJYk5pxu4d7WrzFTu3bh5KQp4OVoWKgg2oFKYmoTtt
	oXxTLQXIzFS0pnJOXT+5kTNgB5w1cNt83AojUZbDEvDlTpGzsFY/FdU1lNQgDrJG+hNElPAPydv
	8KfNw5T9iRownkV8dzuJRhLf3V3UnraU5MsxKA5UuzQph2SIL269vPUwW2PcJx2ofFiu1l6ZPAn
	GI9YatjSR6NW1vMwCrBH4ZgsrsYBVZ9g7d3rik6qZ+T/5VyeBA3IpNHYePri7ETiU6ZUbcARBaW
	/dCSX3XCipGCMV1B9NUn4YmRa9IWnTp+G6mTaNe6PHtIcCK6YDEb3JwDXFPaX9aIMy9yD3PwXx7
	lV4OiTbuwcPcAWQGJNOOaIJ3LxuCfH1jMcVKyrsDozfxX0snIaYaGPNm1JSHVTrAT4Otg7+8=
X-Received: by 2002:ac5:c00a:0:20b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ee8ae00500mr7085660e0c.2.1795447406549;
        Mon, 23 Nov 2026 07:23:26 -0800 (PST)
X-Received: by 2002:ac5:c00a:0:20b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ee8ae00500mr7085607e0c.2.1795447406114;
        Mon, 23 Nov 2026 07:23:26 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeabdcbsm420368466b.46.2026.11.23.07.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:23:25 -0800 (PST)
Message-ID: <15b682bb-4f5e-4084-86e8-df4ccd538720@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:23:23 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm6375: Mark RPM message RAM as
 no-memory-wc
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-3-3e868b4bfa48@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-rpm-memory-non-wc-v2-3-3e868b4bfa48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b045a6f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=948W2wBnRhwx5lWVa8gA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX8xikCgwwixmr
 JDXzIPThcs4ZXaoeWMIwoJKjNIkMndrGe+/y4HatjcnKfaXvKQU4652i9JWfzRO5ZMHm7I1hwUk
 PjdqQwtFAev7q6/onsq/4EQOfC5vO6leaVqRiONrquBXEaxC/ICCj+5gg6uw0iuvHJmmf0qK5ua
 06/ENIa5ot0Aql5Gsbd6MRbqMHKTkBvrWXEc4C1erNmNO/2fcAjM2DjNTEEZF3GR0z8SIo6F4E+
 pBPaNszk4t1kACVs43nAuwnbRGTU8IxdDLxJ13w+wlRrzlSZodYgaUeGMLSwNdXBCmMbLO2UACL
 w+ci/0Q5hmY5+5AWa0mg7lU4sIRHf2JVX2vd+QTE1jxHDgb9IaKiZVKgG+5ILckqrS3BLK73gHS
 zqEFfYjMeDuEZkwDynBmdDeDyBhE4/aHoYRxTW25naPCJKj5Puxeql8J+Qag6Ua66EHA2Rs3EIT
 jYPjFcPvlN5yGbqn33g==
X-Proofpoint-GUID: OjaICGaly2puw6Ct_kRzzTO_X4vFmWS-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX+2nuHaflG9+l
 C9jZAgN8xI6PLzR/hcUDEoleVqDz7juA0fg3NZqFmdP6dL5psXWegJ2hES21GUjIjiLcsmjH9bT
 KopYpeVMZFqZL+4GN4PJHcm1KQoWgkg=
X-Proofpoint-ORIG-GUID: OjaICGaly2puw6Ct_kRzzTO_X4vFmWS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 11/23/26 7:18 AM, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts.
> 
> When Linux runs at EL2 (KVM with VHE), there is no stage-2 translation
> and the write-combined mapping takes effect, so such reads can result
> in XPU violations. When Linux runs at EL1 under a hypervisor such as
> Gunyah, a Device mapping of the region at stage-2 hides the issue, as
> the stricter memory type applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: d3246a0cf43f ("arm64: dts: qcom: sm6375: Hook up MPM")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
