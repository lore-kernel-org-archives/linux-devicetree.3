Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224E452ED3C
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658207; cv=none; b=Bi4E5s3Lx8mIbHPC+wjozch3WLy+gfBVeGA8JCcAQIm9N/p6vWkEH2SllHdl5QxOtPtM0G7LTI+i3kAhasfxBQKEekODcSpEzgrg/5hb8KUAAmiQiNkww8An1pGEN4Xvgd22R0sDyZx2HgOsmevqw+lvNVU4Dp+TRIwxM82WTCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658207; c=relaxed/simple;
	bh=56YorWiGBs8GPX5AuG+hYmp5JOZCucSee0bUTwtH2PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=be2lEXb3lHJHe7mfmIcifg+4so9FkxvUxw3UGhKoUPdy5Es3JoM9BEpvNmamTZ3BUl+Kkg1nlJiNYZtslf7KQliY20jVmUQ8TXtH8mtnJkcyYf8nqXilsuWQ0TGgj1y7GVLdi0ckpqCGWpwUJ+BoU/l95Hs9GxCyWsWrd4JmneA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6XU9agP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQ1Wd9Ns; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6XU9agP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQ1Wd9Ns"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj3mN2777302
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EpSsv4tYPQPGZFy7t09RaRSZ
	W3uOSO6CNjaFKE1zqtw=; b=b6XU9agPGsJ4Me0qBNKXe7OnPT/s2DVpNnvEA5Vs
	0zHKr4EwzPryH8vOvaM3V5/PQxggTJZUh6n6vYIOAndSJsq/Bytw6V+ka/Dd8QMW
	173oP0kBhUob2H+H77Gibc5Wqw1PtmEiAe66K0vWlSDZSIPgwPWMVBkIdilXTfGX
	C8HthhHkk1bYFBW5KxE6CVuFt58tIdNtUwHaamioQDgE4dYJ43eGNvSDRTCJt4JS
	uZISYkyS0WVGSRd55+lAdIlHU6G0jH9c6iiKr4t/zlJXwML0i+7gEex9uH0qxre0
	x4VQMfHFyycuUZbyjLvLxbXGNJEDOjJIjbg0x49No2z64A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m36vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:16:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939d6c515deso191507985a.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658190; x=1790262990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EpSsv4tYPQPGZFy7t09RaRSZW3uOSO6CNjaFKE1zqtw=;
        b=GQ1Wd9NsmLQca5L0f+csS8WERHTkpgSFIdsf7WUsTROzRsMEgqagh3KxMeZsIewRCq
         FFupFJnKCgi+ZI+gAuziRwMFhXvpxsJn/XBGSMiEoemTMhttKybmsV+//q2KELowV/85
         jSRqsK6VfMDATY4trxud6ZEtCLTkfISoAR0mTYauLSMgpqcjH1wpujFaQYjM2NBF9ZdR
         +15Bz3UxwaTJi6SAAlnV1FP6ja9mVXbZz4sJR4Q6j0Pk9cN5BL0Nn05EVFT5dZf5JbVA
         0QuKqZjQhk6JILFukwqcFC5+OavPA2n3p07LZkdqpgcm9ZRCBwoByoxLE6WyoJHvOF1T
         0rrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658190; x=1790262990;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EpSsv4tYPQPGZFy7t09RaRSZW3uOSO6CNjaFKE1zqtw=;
        b=e0Tc5nWFQxwcXCouOr23beDgQASm8cWI+T6vUVaHG9pcvp2VYe21R/QruiMwkp6GMj
         yW0rJplSKcShlUrBsel+veW7VeqwGNdKtSlRc09G2owO2drYmk1y9+LlNBAYAwSMsna3
         eX5/3UUuT8faw8PUcRIS3rKjw389Tccr076s5gVuYdg+UXETbM5ChzCDbluzJV/CDOL4
         akTEaAHOa6p8fVBVqqp8zzpcvkb/3e4So+Nr1kBeLVE+gardkfBAz34U4C+V09AiZ88O
         vaQHU6vbnfj79x9uJN35apaHgBK5VGs60B8H303m734mFwS4mI4OcktJ9W66XlAY8nur
         /oqA==
X-Forwarded-Encrypted: i=1; AKwUvBxS4FdOLerdR6f3FMQOUlOnarDeBA0gjTD8KI8Lz5ySoJW/b05zcB4K0ZztnopMfRQMMFouj+6O3QS+@vger.kernel.org
X-Gm-Message-State: AFuF++mee0CprzbRsGdsP4krddq7qHaDm1K+6z/u9Wr/R6e+KFdlawBN
	DBPNNr9ZXGcQBCwmMhmOgJ4zKVBcYIkYXaIiIQ2eShO9Gm/89sE4FTcFj/rh8xXNEdL1Uca8LE2
	Lk6NntNtj/jjGPXgn9U2cIZZL3UI6o291YG8wFCXR7VDYnUEXMWHl3kkTlTDYmyv7
X-Gm-Gg: AYBFou1OWEcSmygdK5Yj5l8TYVxZ2JSHYRuYyfIt53B5kvDgNuPDuSURNNciPLt5S13
	FUAXh+VsQmHaYvPbCxa+2VLKuKXgw6JYsLEm0IhVSlKipGmEPt15t2SUZkTJGSVH4VctF/3yEWI
	99ahscAJapG3Ws8QMoie8qGO+W47Xfea2yDaEliYCmnr0X9D0elXdt/Dh7n8i2k7HhJLr7hWtGa
	+X42r2YF5BbZoQLiy7/hNWxeNKrQqbr1HT0/R+Cn8xx6mcV7FcKjSrG6xxnZ/WHH0Nb6b1gXH/4
	VT0IT3yN8Mhl2O3YivPrSbkEcxtYhoLjSu/ZevX+wdNrHOosdGyrMLcOqI1DEAwbxlH5r18Xbbo
	3AXuyyq1PWzaGXQ==
X-Received: by 2002:a05:620a:17a3:b0:939:8905:ce9b with SMTP id af79cd13be357-93bb77461a9mr1193812885a.17.1789658189856;
        Thu, 17 Sep 2026 08:16:29 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:939:8905:ce9b with SMTP id af79cd13be357-93bb77461a9mr1193753785a.17.1789658184518;
        Thu, 17 Sep 2026 08:16:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd776e1dsm43210625e9.1.2026.09.17.08.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:16:23 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:16:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 15/15] arm64: dts: qcom: sm8550: Move PCIe phy and
 GPIOs to root port node
Message-ID: <2gxtil7qz2f7jcshm5qfznv5tb6fvguafumgsiua3k7lyrt4dl@qp24s745okz4>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-15-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-15-6272b7caae9a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aac044e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8uv0jTtmD1Va-OgKEnZMIPjATNbouTqY
X-Proofpoint-ORIG-GUID: 8uv0jTtmD1Va-OgKEnZMIPjATNbouTqY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX2Nfbedrx25ED
 zaTBbKirbQ8yajFPVh+ckp8n4TOaKOqwBzDP2tY+7KJJiHgpttrGTOO4lPYPEbXTkQ4jHL+KST2
 e+eMYuU+nM6OnBGZJ07QF8YUSxy3W91V7412nwPqH70fbumP1x+Uy6kaMl/tdJRiH/GJAn03Gjh
 bUwlcSXeRfwrOEWQlkuYk6GmVsbth9R3bPUs4tQ0WhYnGB2oqFCMIKhnJwQqfgIJUzMgCZU4DNS
 iNk3sy/Vb+teoPvL3WtHiC41LKZwAufR80YePY1uXDR9cOYdE/Vpb6wFPRQ161Hu8uosn7cLKTp
 fLA6MMoJfWE1ZcHjRpWY25QPGoKPIyLuAbfWRmq1ClIfgFJqxpFgngPEHl8bMyh7vIrKmQLdu3U
 icw5gmuoOcS3EC8A9gH+zHjlI4cvskiqzi/GpT+kde1cbsE+7T4ycAcehI3dLN//q0P4R779yyW
 tstKwBMLwbBXl1wdPAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfXwfbOlkycbyk1
 GBG8V0eRuZJKwzX6p0c63wEt2yraz1IfUbPRRkM0M3MK+Evn0nsffiV8s9qk7k8hRqUfZcVA7iX
 6VLtento0B6vL9CJLvW7x6X9pU+uHAE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170216

On 26-09-17 17:55:29, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and newly labeled pcie1_port0, allowing
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board files,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
