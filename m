Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0604A64F3
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 16:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366550; cv=none; b=ERxKJihwmwPCuIWN8L9MJOwqhb0WqTqZ3BDV+4YzEX9E5uzKzNcCMuU5KTTkJrAk1hj241h9PKrQWUII4HjG/ilIQlvyhzbm0bgmAkfwR8hf8iubKVAfNIboT2G4+v1Qbbdt1BtyKgVD42u3OaDjCWGqa1kl+/8Yl1mCz3y5G3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366550; c=relaxed/simple;
	bh=tDojO+9BEVk++M6GICcmNllqJSFAUFCqrnceqbKzFgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwGOjT6jTv/jxVCAs7G5cfshlyes9IULDM6Y6SGFJXmYFET3H0pC+KTrOQx/g+Zv5UsCFD2dSPeeresRNeWsHsIujFIbIjXcef3X0n+UlShxJmOxCuhhA/JCgqfxeaWimizGwoXXWgZWWRy1CblrMktsuxmscDU6BsuuVDd/ywk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKj2fWBW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+4jpGdh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKj2fWBW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+4jpGdh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZVI0770158
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 16:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gaRx+QAw5TNdv7ApNve7Ep0kaU3gmKx1F2L7nke2MOg=; b=eKj2fWBWy3IP9z98
	ttR00tuafiDEs0vA/78nvcech+E/W/p5nwNGoGphTODCpVY0aYkDT6AGwc+g8x/5
	2YlGgYWbD1aq3tK1qa2QcK1etDul98uhC1Tj4zBbf/q0oxgesizpYVatPbdUC9RY
	X0m+dFlMFSoygMr8vPHQht8PdwXI3IzFbQudL244tWMup1IDAsf7eu82no4Rz2E8
	lrp6S8ebp4SgKcPn1H4A3KtjaXB+0M9akSFJWIAwZtlA3UPY+TOqFdJQXOGgAS7c
	S/UKTvtQxewPS40HErFXV56+MHB4ISx1nriYqvOCy52iV69mT9tzmfEdt8Bb3Emz
	pZTHng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja0r23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 16:29:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso32869285a.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 09:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366547; x=1788971347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gaRx+QAw5TNdv7ApNve7Ep0kaU3gmKx1F2L7nke2MOg=;
        b=b+4jpGdheS9YCzKMPMgOK29mCkEnJDRpirHaXt8TkNMJDjatV+SDOQrZ11dc6VV3O+
         BEqXfTGlvmzI2WKcePXY8cOo+kr5L5d2HFKJ9fMTgLw3yp4jOdaw2ZkQcKFay/Z+aYUY
         gXTBZcWOKQRYMMKg2YnmpyCHBwCzajyjzPReSNdpjNh9jZjNcsnggvzynM6zvifIje9t
         GB7zq6cZB3LW1hAztnhJI3u1aMusOwTtcD8zHe6PRVSfI17tV2lUND5n/pEk62DzAJL9
         by03Jzb7Zm0PaYSiXgq1ZiPNcqLOPbRDB7qgD1HSJr3XPjo1wZ/mWJp8f7PoYzSfCSPC
         fabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366547; x=1788971347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gaRx+QAw5TNdv7ApNve7Ep0kaU3gmKx1F2L7nke2MOg=;
        b=HjC3mk0O3QsC5XWYgPtU1i8t7jtOUDxiLp/26YWR6MCrr18rkw415Kg61vsfSdTGsD
         kgMmYKDO6TzCrApx2F+SrxsotrBv9aryQk46HvDWwOOt1v148tUQQWClAfqn+SHfb39F
         Uap6mVpqPCIQ/GbEk+IJp6YfyD0YZV77ujuXLDW+6ma5ef/RZoPbnmFVPrqGlbWyccYI
         WzXz0wUq/XYkgrD7qZqIzq3+Xyw8DMsweEr7fFKHeRj8SXMm8h6AUGRBPSCkknd4cbUc
         qp4wgu0jZrwCIp8PHbtgWaLqoVGCUnib1mWUOI0VHvfUSQBQsg99/BjzB4sdvui7XqOp
         YF4g==
X-Forwarded-Encrypted: i=1; AHgh+Rqk0u+vZGUVg62f85rtbCWDaMF3IORAQP/HGvOLN7ZnOX+O2QlAFCBmmjKtSnS3ijd1y3yZj4eKez6t@vger.kernel.org
X-Gm-Message-State: AFuF++kRvYxd6+BEFUY59VTbt5Lua5xzW8yBLW+ANU1+F02TpLXxmI96
	SkbhsVbEHoG7fOwQmaxYi4m1/AvzPT5+KuzexWEhiz0i9hbz5ylNL3DhfTL/bYYYsPDdPLI98aI
	yuY/PNOpsv5ltgbn3DzSrD4vy1+JeJ6YRt06bqEbvACyc8NiSqKniuUhjuaZBu4bO
X-Gm-Gg: AR+sD11MjV00FNS87mxqN1XhoSf9hdij8S+NhOHk9GQ4mbLRFOgqVrZO5/6IOW5ZavW
	xnrs1Go7GY7+vcufAy2oLyv1akWFVaBnj4iDxTfSLmyfUwQh+5NiDC+Y4UrEqDG3aD2QENIDAUh
	JaLUuoQXXSvq6fiDiTPccletAARP5O3bIv0npV50yqLtoFAYJzJyTH4IrpYrumn0cibvLjz1+Rx
	9b397NBQJLbmZUQMmFbmt/mxbWuij1U/6F53t85APefhZHhFYoHYkk4QzwGz/gpxbr1NGBeyvj0
	BksB5bhX2DuCvTfo3Ymk/HhgymJYQwsFQvFtYo8qdTxEdkFqLcghfwkoF7athr3yqmphO9XCmaQ
	hugwOSVQjoSRYR08IZOAkHA==
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr408222185a.6.1788366546839;
        Wed, 02 Sep 2026 09:29:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr408217785a.6.1788366546236;
        Wed, 02 Sep 2026 09:29:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f932abasm1285886a12.16.2026.09.02.09.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:29:04 -0700 (PDT)
Message-ID: <cbca4156-a461-4d01-9576-352f719016eb@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:29:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD
 Card via overlay
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
 <20260826112456.482982-3-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826112456.482982-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dbJqN9Awpt1zATUkNTwXBr8oOIbQingL
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a984ed3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0kTFbZp8cJiOs2Wp4RgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX3JDIRghRndWv
 PZIBza5fMt5DN1o2xKYc6vu1cZaqWyjlc3B2cIvu1o6jX0wsAVrrJUyeYEmffQJlkx1kPzPXm8T
 C9MbljcwRHJaXokys+l84LxcmgSJvrQ=
X-Proofpoint-ORIG-GUID: dbJqN9Awpt1zATUkNTwXBr8oOIbQingL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX8m2/bwAhWxNC
 rt28ZfA6RIZQ5PplmLZ2cvumDauenRToBdPFHxysxaou6oZqL82yxdsOFq6sEexQZPUI56DlkZP
 UMh2DBk694FMAOrHxHnZ3Q8qOBYtz415ySWEwFyinSafd0t7u2Ntqq+xOPjWJA4YY76tOvsuSxA
 v8k0ri/QqyJwT9a9OPpKiv1RVAF7ceoHqVJn24GmKtwbfxYykAz1+RzBz7E6fdNnhS8HJdzuyeq
 xbjGUAXHkXCtK5tCllGTqxqEEA/lVjQO2XYsAV1tmVejDfzWB89cB6e7fgYeXE7Z09RW4pgvLvY
 6LD1lzinaEXNxoZfeNhV2J7IMETnckEG/dkoIo04n/xyW+bRppvivXZmDtrfFAW1b9T1ewXbSvt
 UtDLsj4P1GRBUTcaGZHuI4GvLXjIKVX3UB11gX4rW9bmf9ZhHyeIKbjFNCU9zgi/Z2wVvli7iVH
 spzi5vYE7GBm5J4gfIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020145

On 8/26/26 1:24 PM, Monish Chunara wrote:
> The monaco EVK board supports either eMMC or SD-card, but only one can
> be active at a time.
> 
> Make the base monaco-evk.dtsi storage-agnostic by removing eMMC-specific
> configuration from it. This allows storage media selection to be handled
> through device tree overlays.
> 
> Introduce an SD card overlay that enables the SD Host Controller
> Interface (SDHCI) for SD-based storage on the monaco EVK board.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

[...]

> +&sdhc1_opp_table {
> +	opp-100000000 {
> +		opp-hz = /bits/ 64 <100000000>;
> +		required-opps = <&rpmhpd_opp_low_svs>;
> +	};
> +
> +	opp-202000000 {
> +		opp-hz = /bits/ 64 <202000000>;
> +		required-opps = <&rpmhpd_opp_svs_l1>;
> +	};
> +};

This only adds to the existing table, not removing the existing
entries

Based on the previous discussions at

https://lore.kernel.org/linux-arm-msm/de10ed05-a0fc-4f84-83ea-8810270ff2d6@oss.qualcomm.com/

I'm not sure this is intended

Konrad
