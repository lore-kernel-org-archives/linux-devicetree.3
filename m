Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667913;
	b=MW8kkAkr1HpqtCtDwUxj6LH52sqMlN2uXpeTfitD3ir8b6B5aqXa2OGHQUk1/P4W+BaW
	 imoDgP/jSeagVBdoL8yTlUULp1juyALoCsIbW3PbN+MMyCtRGxpzg4UEimL1hXXich1GH
	 Ww0G9pPcbVP/Zd+eqNyhyI4Qjpg+MwRTnb2rofNRpSDwfo26qMb75ptHPV4SS53LeXD12
	 PXwlMFTwYf3MD2QfFtvv915pkdlA9iZezNOiPqOREcJAiMhgO2tRClT/N3C2iI5cGyZgA
	 KbBN488llpWi03tPEU2XUJF2tyJ/GaSQXVE8aZUb8U/f9Md+eWY7N5wzIpps5x2YMBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667913;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VM4vHc79k+V21DsCXm9ibSORvoSng+h2vl6tYKJCPEQ=;
	b=xQoywTKqmX5UcgvcmXf+egsyraCZfibSujQKnXqjTRq2TNepj5qJL/mTl572avThnr2s
	 S1ZU1vJoFxvviFz4j+G77ORrtDF5GRgEusPmnlsugXXsAYfzaxeAwX99Cga8YG6iiYQXD
	 FSxRi3YRD1bvjn2brPDt0I8mA068OiP1ThlCWhgeldBXImXrNQPFX9ZZnHZauK/iYcOw1
	 C1IDn6oHFHB/D7DKlC9mPClBWJhvqapIhPgHEGkbHqKSZ19kKCenrEmJOB+t3yNV9GZQA
	 t0xAjajaxbTbv/x1RV+zPd3VKh9J1C9ycPr1TqtDRsZ8jIXMmMX7WgRYHvQfNnaVRvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cP/y3WfV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBxd177X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FCE606A331
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9FCE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cP/y3WfV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBxd177X
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkHIE927484
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VM4vHc79k+V21DsCXm9ibSOR
	voSng+h2vl6tYKJCPEQ=; b=cP/y3WfVHHAWw346QA1QJx40/eYMAkSFZFVTchG3
	BUUHKFkcs96k+R7KTGjl1lp/cYBbw/7gpGL4Gi2iKY/zNrKebpSQEvnydZvOEykr
	mv6YXQKSGRRSIBNnvTRHbtk7Z/Ap26GJhju76LlGkhdpgizLyNMMYUkzLML/y5RO
	G5SW7IkhSNPyrOem68iOHkO60MDsqspFsWv4mzDz18JyRqxCPnJkwK3dM4mMo75y
	bFZas0zZ1PU5Mm1HeKgoPsF4711TP/wXoAGUoBOZuC3do/056vAg4oBF+vowxIy1
	pBxGdU0GEypIIlvZFMGf6UkoKriTbIQjCwFGvREFTlJlxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhds0bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:51:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495a1f5e47so227775285a.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 06:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794667911; x=1795272711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VM4vHc79k+V21DsCXm9ibSORvoSng+h2vl6tYKJCPEQ=;
        b=WBxd177XnfjLfFDeDH5I776Fl+30W2Bs5SS1kifemAGoszOx9CF4dJymxhTyure9sy
         wgaa0nViyU/zfclGzhwn6ao1CEq7GXfGNdZddrRWjo1ADYFowkOtgdTLys5zMp0QC01S
         i0tP4pF+2t7XK08d7AP4mXOLf4cmfg3T/XdurPcSUQDNH22GPCKJBN5dw5aVa9iSYGR/
         WluHNKOzep5EsguiJwmFXKVr5emp6zxgKsdGaLSTAsGPpycxJYLp54L+7UQv2P6y4LgK
         4VKd763oQ0MYbDYynA9G53TSScEwdRef/OFcBZVdqRw86DBdQxUwP5JfCzHQHQJ8Sk/L
         HN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667911; x=1795272711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VM4vHc79k+V21DsCXm9ibSORvoSng+h2vl6tYKJCPEQ=;
        b=wrLB6edwg8A/lcHPPdMw9mNm8leyFe7+Ksu55pfCXIaoqCpAqR1ql1BciXjQVGI2Cl
         2g0saNPtsgl8Qz5zt/4pNDzKEj81M9jvfaPDdC/iPm3NDSHIekl3y99gIdyf5HwiqIfq
         UoMxnuLIeGdCc+9YC0+xKuEgilaxF6iXyO3KFbBYZDgBfrqp3J7JGM5jdpCF/iT16Wmc
         OJHwY5IjEL6J3wX67ZEJCBPTzxQGXrHEfl8D+JdYmOQI5hYR4ehsIkNZ2ZmcOdq0cLCJ
         EXsiseiRgzFvAMRdjJhkUedZr5MqZ62esii63gBaqXGKshU6QDYZXV63rp1iQOOmzDCw
         mYbg==
X-Forwarded-Encrypted: i=1; AL+hErFu4KUiM/FIUI9qCpGjIMntB2jaKxdYIku5hEykRFfoLD0HqkgkDo7v0Y1ZWLI6t64fDBOOBjCeAArn@vger.kernel.org
X-Gm-Message-State: APuU4Z/wS2b6qUL2UINIiqmd+2tysUeHra0l5lyTrYi/QBm2ebz1J0+F
	c0SVMoSKd/+Jao1loob8ni9PqN05xl0bmkr1WBuhGMgWnI8poRK7uRcg9f7gWMGWkvM1L7tGbk5
	RwMHQ7cvNRH64ZVbinGaJP37i574RPB4Q4jabhtZy50TOXglcRC3ZxVuTEbgWx0Kk
X-Gm-Gg: AYBFou3zHklux/0+yOoI6Uhe7e2smM/phjSrSNSxTCmQ7zj+y8uZoOjRgDyGOeIYloe
	PNMkgPQ8ZdNXRDrNCrnYn0xl4dSsP/IuAvzUlm0ovcIxYsPUxEIMmiQhY5cdSFfrb0dT3MTtP77
	JmO5ITT83Jh8z1uIbZlSZwxMVAzjDykFuUiA7WjkIWBR3pR9S1zPzBcAOK8O/VFPIkpEYo6mUYi
	s8jTrZUZi2seMkTgcdbtnaEO7xyutcE9by+vE2FNY6SgH+zGROYCOPz2yfO3EY7WmlSm1qk6bCk
	RsI2ZqAuOt1sXo3P8equDEOkgmeQOl4axybOiSTESdchvP7QGbgy8H5Pu5EHSEKVzjUnsQpge5U
	97fw0fh52f9m7eFxILyi8wR9XN7fL06pUitxJ5WzWmKG/Sz+xVZMczrA66CPyKDj5
X-Received: by 2002:a05:620a:2715:b0:93f:362a:a893 with SMTP id af79cd13be357-9494bc423bbmr812476185a.50.1794667910610;
        Sat, 14 Nov 2026 06:51:50 -0800 (PST)
X-Received: by 2002:a05:620a:2715:b0:93f:362a:a893 with SMTP id af79cd13be357-9494bc423bbmr812472185a.50.1794667909973;
        Sat, 14 Nov 2026 06:51:49 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm10211991f8f.27.2026.11.14.06.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:51:49 -0800 (PST)
Date: Sat, 14 Nov 2026 16:51:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Enable Iris
Message-ID: <cokprcupy7yxhjgwpu3ycgm6rpgi5khwkoppxfakvms54kpbnr@hzsrwxiayvjj>
References: <20261113-fp6-iris-v1-1-5496b6d99911@fairphone.com>
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
In-Reply-To: <20261113-fp6-iris-v1-1-5496b6d99911@fairphone.com>
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6af87587 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=rhqQhfuC2zV-thtKVLMA:9 a=CjuIK1q_8ugA:10
 a=AYr37p2UDEkA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfXyXPGQk2F6s1o
 oYllgCdGOOxA06XCpkV9/9Tdw6giRis3i8rI2fxnmYOTb0dBDIkDnT0+A0hHfiq93PN6etL3+fn
 eBB6Z8yo43SH1VPXiBT0Og98MkX7NDo=
X-Proofpoint-ORIG-GUID: HrstRn2BIIr-Qf_hh-I80zqG9v354mpm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX1bhyXWZ2Gc96
 8Ha++UCMaNJB+TrAS74bqznJjo5MykoeF9i0lyYrkwjRhbqUw0tS2KytuNeKViin0JqIS0A8E8I
 9aLo5fPO2zeCeeM+y4HqxrqSSO1dr9TDX/DXM9eptkaTRzINkBFHW/OlrIImxBY4BhB8wu8na6I
 2K3/SBU1hxkB2v2ZSkPUlLhUM/zj38AlxxQQVt8ZDql08Tuh/iX+hyIIUaZ3hL6KjDJ3PLhxcQA
 /43zjktThgkbHq354Jr0ytCtNeQMWcl7HAAMNI1+q1/EBXrpf1fuOpyDJKcyN+yCrH30fxHedV8
 kCslroV4vLS0VRWptXmThxuhJEnKhZLfsfosdo08I5A87S9R2YRd6mPO5hg5R+s0e42vaOr+teK
 HDe2zGOL04kzk4zxjPa8AQxfBzpkmjERPP+uhpBWSKVsjCEx6ofaERTffz1CYOmVGmfynx3RB3g
 Ber0tB5voIU4T3np7UQ==
X-Proofpoint-GUID: HrstRn2BIIr-Qf_hh-I80zqG9v354mpm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140059

On 26-11-13 15:52:23, Luca Weiss wrote:
> Configure the firmware-name and enable Iris so that hardware-accelerated
> video decoding & encoding works.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
